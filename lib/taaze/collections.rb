require 'oga'
require 'open-uri'
require 'date'

module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's collections of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=1
  # Sampel output (plz remove them after passing the test):
  # {
  #   {"title"=>"村上收音機", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100635522"}
  #   {"title"=>"尋找漩渦貓的方法", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100210251"}
  #   and so on ...
  # }
  class TaazeCollections
    USERS_URL = 'http://www.taaze.tw/container_zekeaclt_view.html?ci='

    def initialize(user_id)
      parse_html(user_id)
    end

    # Return a hash of user's collections
    def collections
      @collections ||= extract_books
    end

    private

    # Parse the html of the url page.
    def parse_html(user_id)
    end

    # Return the books in the format specified in spec.
    def extract_books
    end
  end
end
