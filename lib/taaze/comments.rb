require 'nokogiri'
require 'open-uri'
require 'date'
require 'json'
require 'net/http'

# Module Taaze
module Taaze
  # This class get the user personal page as an input
  # return a hash of user's collections information
  # For example, with user's url: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728
  # here's the user's comments of books: http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=2
  # Sampel output (plz remove them after passing the test):
  class TaazeComments
    USERS_URL = 'http://www.taaze.tw/container_zekeaclt_view.html?ci='
    MAIN_URL = 'http://www.taaze.tw/container_zekeaclt_view.html?'
    API_URL = 'http://www.taaze.tw/beta/zekeaCommentDataAgent.jsp?custId='
    BOOK_URL = 'http://www.taaze.tw/sing.html?pid='

    def initialize(user_id)
      # split_url('http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728&cp=2')
      user_id = numeric?(user_id) ? user_id.to_s : user_id
      parse_html(user_id)
    end

    # Return a hash of user's comments
    def comments
      p @comments
    end

    private

    # Check if it is a integer
    def numeric?(obj)
      obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil? ? false : true
    end

    # Parse the html of the url page.
    def split_url(url)
      str = split_get_last(split_get_last(url, '/'), '?')
      str = split_get_last(str, '&', -1)
      str
    end

    # split string and get last
    # index for
    # -1 -> return all array
    #  0 -> return last obj in array
    #  >=1 -> return obj on array[index]
    def split_get_last(str_to_split, character, index = 0)
      arrtmp = str_to_split.split(character)
      if index == -1
        arrtmp
      else
        index = index == 0 ? arrtmp.length - 1 : index
        strtmp = arrtmp[index]
        strtmp
      end
    end

    # Parse the html of the url page.
    def parse_html(user_id)
      url = API_URL + user_id.to_s + '&startNum=0&endNum=0'
      # first test and get comments num for the user
      first_doc = JSON.parse(url_get_html(url))
      total_num = first_doc['totalsize']

      url = API_URL + user_id.to_s + '&startNum=0&endNum=' + total_num
      # mainDoc is the all json date for the user's all comment
      main_doc = JSON.parse(url_get_html(url))
      extract_comments(main_doc['result1'], user_id)
    end

    # Send url to get response
    def url_get_html(url_str)
      url = URI.parse(URI.encode(url_str)) # first get total size
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
      res.body
    end

    # Return the comments in the format specified in spec.
    def extract_comments(content, user_id)
      # Json format~
      # "content":"勇氣就是熱誠，來自於我們對自己工作的自信心；.....",
      # "title":"",
      # "status":"C",
      # "stars":"5",
      # "prodId":"11100597685",
      # "titleMain":"行銷之神原一平全集(精裝版)",
      # "orgProdId":"11100597685",
      # "pkNo":"1000243977",
      # "mdf_time":"2015/10/15",
      # "crt_time":"2015/10/15"
      #
      # orgProdId -> bookID -> 11100597685
      # title -> book title
      # content -> comment
      # comment_url
      # pkNo -> comment ID ->13313301
      #
      # http://www.taaze.tw/container_zekeaclt_view.html?co=1000238964&ci=12522728&cp=3
      # co->comment ci->user
      data_arr = []
      content.each do |cmtItem|
        data_hash_sub = Hash.new {}
        data_hash_sub['title'] = cmtItem['title']
        data_hash_sub['comment'] = cmtItem['content']
        data_hash_sub['book_url'] = BOOK_URL + cmtItem['orgProdId']
        url = MAIN_URL + 'co=' + cmtItem['pkNo'] + '&ci=' + user_id + '&cp=3'
        data_hash_sub['comment_url'] = url
        data_arr.push(data_hash_sub)
        # break if idx == 0
      end
      @comments ||= data_arr
    end
  end

  # for test remove release
  tmp = TaazeComments.new('13313301')
  p tmp.comments
end
