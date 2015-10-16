require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

USER_ID = %w(12522728 13193872)
collections_from_file = YAML.load(File.read('./spec/testfiles/collections.yml'))

USER_ID.each do |user_id|
  collections_found = Taaze::TaazeCollections.new(user_id).collections

  describe "Get all the collections with specific user's id" do
    it 'has the right number of collections' do
      collections_found.size.must_equal collections_from_file[user_id].size
    end
  end
end
