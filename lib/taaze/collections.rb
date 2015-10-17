require 'json'
require 'open-uri'
require 'date'

module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's collections of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=1
  # Sampel output (plz remove them after passing the test):
  # [
  #   {"title"=>"村上收音機", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100635522"}
  #   {"title"=>"尋找漩渦貓的方法", "book_url"=>"http://www.taaze.tw/sing.html?pid=11100210251"}
  #   and so on ...
  # ]
  class TaazeCollections
    USERS_URL = 'http://www.taaze.tw/container_zekeaclt_view.html?ci='
    API_URL = 'http://www.taaze.tw/beta/zekeacltBooksDataAgent.jsp?custId='
    BOOK_URL = 'http://www.taaze.tw/sing.html?pid='

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
      url = API_URL + user_id
      first_doc = JSON.parse(open(url).read)
      totalsize = first_doc['totalsize']

      url = API_URL + user_id + '&startNum=0&endNum=' + totalsize.to_s
      @doc = JSON.parse(open(url).read)['result1']
    end

    # Return the books in the format specified in spec.
    def extract_books
      _booklist = []
      @doc.each do |book|
        _book = {}
        _book['title'] = book['titleMain']  
        _book['book_url'] = BOOK_URL + book['prodId'] 
        _booklist << _book
      end
      _booklist
    end
  end
end
