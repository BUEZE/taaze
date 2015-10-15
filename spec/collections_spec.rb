require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

URL = ['http://www.taaze.tw/container_zekeaclt_view.html?ci=12522728', 'http://www.taaze.tw/container_zekeaclt_view.html?ci=13193872']
collections_from_file = YAML.load(File.read('./spec/testfiles/collections.yml'))

URL.each do |url|
  collections_found = Taaze::TaazeCollections.new(url).collections

  describe "Get all the collections with specific user's url" do
    it 'has the right number of collections' do
      collections_found.size.must_equal collections_from_file[url].size
    end
  end
end
