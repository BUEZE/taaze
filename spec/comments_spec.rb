require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

URL = ['http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728', 'http://www.taaze.tw/container_zekeaclt_view.html?ci=13193872']
comments_from_file = YAML.load(File.read('./spec/testfiles/comments.yml'))

URL.each do |url|
  comments_found = Taaze.new(url).comments

  describe "Get all the comments with specific user's url" do
    it 'has the right number of comments' do
      comments_found.size.must_equal comments_from_file[url].size
    end
  end
end
