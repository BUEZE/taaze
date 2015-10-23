require 'yaml'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require_relative '../lib/taaze.rb'

BOOK_ID = %w(11100763435 11100745134 11100714084 11303096752)
tags_from_file = YAML.load(File.read('./spec/fixures/tags.yml'))

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('tags') do
  BOOK_ID.each do |book_id|
    tags_found = Taaze::TaazeBooktags.new(book_id).tags
    describe "Get all the tags with specific book's id" do
      it 'has the right number of tags' do
        tags_found.size.must_equal tags_from_file[book_id].size
      end

      tags_found.map do |tag|
        it 'finds tags in the test tags' do
          exist = tags_from_file[book_id].include? tag
          [tag, exist].must_equal [tag, true]
        end
      end
    end
  end
end
