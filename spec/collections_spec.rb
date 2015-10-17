require 'yaml'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require_relative '../lib/taaze.rb'

USER_ID = %w(12522728 13193872)
collections_from_file = YAML.load(File.read('./spec/fixures/collections.yml'))

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('collections') do
  USER_ID.each do |user_id|
    collections_found = Taaze::TaazeCollections.new(user_id).collections

    describe "Get all the collections with specific user's id" do
      it 'has the right number of collections' do
        collections_found.size.must_equal collections_from_file[user_id].size
      end

      collections_found.map do |book|
        it 'finds book in the test collection' do
          exist = collections_from_file[user_id].include? book
          [book, exist].must_equal [book, true]
        end
      end
    end
  end
end
