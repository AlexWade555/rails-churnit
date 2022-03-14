class CardsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :compare

  def index
    @cards = Card.all
  end

  def show
  end

  def compare
    session[:onboarding] = {} if session[:onboarding].nil?
    session[:onboarding][:income] = params[:income] if params[:income]
    session[:onboarding][:spending] = params[:spending] if params[:spending]
    session[:onboarding][:card_selected] = params[:card_selected] if params[:card_selected]

    # Truncate the list of cards by excluding cards where minimum income exceeds user's income
    @truncated_list = Card.where('minimum_income <= ?', params[:income])

    # Apply a DYNAMIC SORT (user determined):

    ## Call order of drag & drop result from home page that was used in preference
    ## This should result in an array of string consisting: ['fee', 'cashback', 'reward', 'foreign']
    ## Take the index of each string, and use active record queries to sort recommended cards

    queries = {
      'fee' => "annual_fee_init ASC",
      'cashback' => "cashback_reward DESC",
      'reward' => "bonus_point_reward DESC",
      'foreign' => "foreign_transaction_fee ASC"
    }

    order = params[:preference].split(",")
    ordered_queries = [queries[order[0]], queries[order[1]], queries[order[2]], queries[order[3]]]

    ### apply the order of preference below:
    @sortedcards = @truncated_list.order(ordered_queries[0]).order(ordered_queries[1]).order(ordered_queries[2]).order(ordered_queries[3])

    ### Determine ChurnIT score (this will need to be reworked to take into account user's spending)
    @churnit_score = 'interest_free_period - annual_fee_after - interest_rate * 100 - late_payment_fee - foreign_transaction_fee * 100'

    # Apply ChurnIT score and STATIC SORT:
    @recommended_cards = @sortedcards.order(Arel.sql(@churnit_score)).limit(3)

    # think about making a carousel for the cards
    # https://swiperjs.com/

    # once completed, refactor using the Card Selector service
    # below is a sample syntax
    # @recommended_cards = CardSelector.new(
    #                         session[:onboarding][:income],
    #                         session[:onboarding][:spending]
    #                       ).call
  end

  def select
  end
end
