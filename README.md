# [🔗App*](http://www.churnit.me/) | [▶️Walkthrough](https://www.youtube.com/watch?v=1RnXYYraiQc) | [✏️Wireframe](https://www.figma.com/file/Yp653rY8BBTi3twc78XWkJ/UI-Kit%2FPage-Mockup?node-id=138%3A1107)

![Main Page Scrolling Preview](/app/assets/images/mainPageScroll.gif?raw=true "Main Page Scrolling Preview")
![Drag & Drop Card preference](/app/assets/images/dragAndDrop.gif?raw=true "Drag and Drop Card Preference")
<br><sub>_Best viewed on Desktop (@media width >= 1200px)_</sub>

A webapp created for seasoned credit card [churners](https://www.reddit.com/r/churning/) looking to quickly compare AUS credit card offers. All card specs are based on data made pubclicly available by [Finder](https://www.finder.com.au/credit-cards) (last updated 18 Mar 2022).

Created by [Hendrick Manullang](https://github.com/diplobrat), [Max Wang](https://github.com/jlmaxwang), [Todd Evans](https://github.com/tomiev), and [Alex Wade](https://github.com/AlexWade555) as part of [Le Wagon](https://www.lewagon.com/) bootcamp.

# Setup
Clone repo
<pre><code>gh repo clone diplobrat/churnit</code></pre>
Run bundle
<pre><code>bundle install</code></pre>
Set up active records & run seed file
<pre><code>rails db:create db:migrate db:seed</code></pre>
Run server on local host (type in http://localhost:3000/ into your browser and hack away!)
<pre><code>rails s</code></pre>
Make changes to the seed file
<pre><code>code lib/seeds/credit_card_info.csv</code></pre>

# Tech/Frameworks Used

Framework
* Rails

Front-end
* Ruby
* JavaScript
* HTML/CSS

Gems/Libraries
* [Sortable.js](https://github.com/SortableJS/Sortable)
* [fullPage.js](https://github.com/alvarotrigo/fullPage.js/)
* [isotope.js](https://github.com/metafizzy/isotope)

Hosted on
* Heroku

# Future Considerations #

- [ ] Automate database update process
- [ ] Mobile port
- [ ] Open Banking API connectivity for spending analysis
- [ ] User dashboard
- [ ] Calendar integration
