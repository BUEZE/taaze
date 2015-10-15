require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

URL = ''
collections_from_file = YAML.load(File.read('./spec/testfiles/collections.yml'))
collections_found = Taaze.new(URL).collections

describe "Get all the collections with specific user's url" do
  it 'has the right number of collections' do
    collections_found.size.must_equal collections_from_file[URL].size
  end
end
