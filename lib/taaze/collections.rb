require 'oga'
require 'open-uri'
require 'date'

module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's collections of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=1
  class Taaze
    def initialize(url)
      parse_html(url)
    end

    # Return a hash of user's collections
    def collections
      @collections ||= extract_achievements
    end

    private

    # Parse the html of the url page.
    def parse_html(url)
    end

    # Return the books in the format specified in spec.
    def extract_books
    end
  end
end
