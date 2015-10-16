require 'oga'
require 'open-uri'
require 'date'

module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's comments of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=2
  # Sampel output (plz remove them after passing the test):
  # {
  #   {"title"=>"張愛玲的世界", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100635522", "comment"=>"書中所收，尤其是王禎和〈張愛玲在台灣〉一文，珍貴且真摯。", "comment_url"=>"http://www.taaze.tw/container_zekeaclt_view.html?co=1000238964&ci=12522728&cp=3"}
  #   {"title"=>"小團圓", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100192439", "comment"=>"祖奶奶晚期風格，誠實、枯寂又暴烈。", "comment_url"=>"http://www.taaze.tw/container_zekeaclt_view.html?co=1000238963&ci=12522728&cp=3"}
  #   and so on ...
  # }
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
