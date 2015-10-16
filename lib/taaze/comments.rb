require 'oga'
require 'open-uri'
require 'date'

module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's comments of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=2
  class TaazeComments
    USERS_URL = 'http://www.taaze.tw/container_zekeaclt_view.html?ci='

    def initialize(user_id)
      parse_html(user_id)
    end

    # Return a hash of user's comments
    def comments
      @comments ||= extract_comments
    end

    private

    # Parse the html of the url page.
    def parse_html(user_id)
    end

    # Return the comments in the format specified in spec.
    def extract_comments
    end
  end
end
