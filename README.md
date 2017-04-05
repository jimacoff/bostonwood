[![Coverage Status](https://coveralls.io/repos/github/nate01776/bostonwood/badge.svg?branch=master)](https://coveralls.io/github/nate01776/bostonwood?branch=master)
![Build Status](https://codeship.com/projects/8b378030-72f5-0134-11b6-1ae66e72c451/status?branch=master)
<a href="https://codeclimate.com/github/nate01776/bostonwood"><img src="https://codeclimate.com/github/nate01776/bostonwood/badges/gpa.svg" /></a>
<a href="https://codeclimate.com/github/nate01776/bostonwood"><img src="https://codeclimate.com/github/nate01776/bostonwood/badges/issue_count.svg" /></a>

# BOSTONWOOD

<a href="http://www.bostonwood.com">bostonwood.com</a>

##DESCRIPTION
App built in Ruby on Rails as a digital catalouge for a Boston-based furniture company. The site is designed to allow potential customers to quickly view products, pricing and information offered. The admin facing side allows users such as the company owner who have minimal web experience to easily add or update products, pictures, pricing and more on the site. The site launched in February 2017, and currently recieves around 600 pageviews a day. 

##FEATURES
* Over 200 products in 20 categories currently, with final site expected to have around 500 across 30 categories.
* Responsive design works across all screen sizes.
* Admin users can add and update products.
* Single 'product' page template that renders fields such as paint colors based on product manufacturer.
* Price grids are created on page load in any size and two standard configurations based on the JSON data being passed.
* Cloud storage integrtion for all product images. Furniture colors and homepage images are stored on Heroku server.

##TECHNOLOGIES USED
* Ruby on Rails v 5.0
* Javascript
* Heroku hosting.
* CSS & Foundation
* Cloudinary storage for product images utilizing Cloudinary gem
* Devise gem for admin login
* Factory_Girl, Capybara and Rspec for testing

##RUNNING LOCALLY
* Clone repo to local machine
* bundler install
* $rake db:create
* $rake
* The DB can be cloned from heroku - make sure you are logged in with the matching account on local machine
* $heroku pg:pull DATABASE_URL bostonwood_development
* $rails s

##USING ADMIN INTERFACE
* go to /admins/sign_in in browser, login
* admin controls will be at top of sidebar and at the bottom of category and product pages
* Will add full features ...
