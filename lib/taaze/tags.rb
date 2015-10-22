require 'open-uri'
require 'oga'

module Taaze
  # This class get the product id as an input
  # return a list of tags 
  # Sample input with  product id : 11100763252
  # Sample output ['轉型正義', '白色恐怖', '社會科學', '臺灣民主運動']
  
  class TaazeBooktags
    BOOKS_URL = 'http://www.taaze.tw/sing.html?pid='

    def initialize(book_id)
      parse_html(book_id)
    end

    # Return a list of book's tags
    def tags
      @tags ||= extract_tags
    end

    private

    #parse the html
    def parse_html(book_id)
      
    end

    def extract_tags

    end 
    

  end
