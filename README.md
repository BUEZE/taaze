# taaze [![Build Status](https://travis-ci.org/BUEZE/taaze.svg?branch=master)](https://travis-ci.org/BUEZE/taaze)

---
Taaze is a light package wrote by Ruby. It easy to use for getting comments or collections from online bookstore [Taaze | 讀冊生活](http://www.taaze.tw/index.html).

### How To Get Started
Install by Ruby gem [Taaze](https://rubygems.org/gems/taaze)

`gem install taaze`


### Requirements
- [Nokogiri](http://nokogiri.org) - for parsing html use
- [JSON](http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html) - parsing json data

`$ bundle install`

### Usage
This gem may be used as a command line utility or called from code

#### How to get ID
##### User's comment
- You can get user list at [冊格子](http://www.taaze.tw/zekea_index.html)
- In every user's personal page , you can get his or her ID from URL
	 - For Example :
      - http://www.taaze.tw/container_zekeaclt_view.html?ci=13313301
      - 'ci=' is User ID
- And there are 2 argument for use
	- --comments ： get all comments for the user
	- --collections ： get all book collection for the user
- And add yaml path where you want to store
	- --output [file_path]
- Finally the Taaze will return yaml format file 

### CLI

`taaze --comments [user_id] --output [file_path]`

or 

`taaze --collections [user_id] --output [file_path]`

### For Example
      
`taaze --comments 12522728 --output ./comments.yml`

`taaze --collections 12522728 --output ./collections.yml`


### Output Sample

![Example.jpg](Example.jpg)