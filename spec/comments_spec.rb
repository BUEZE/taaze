require 'yaml'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require_relative '../lib/taaze.rb'

USER_ID = %w(12522728 13193872)
comments_from_file = YAML.load(File.read('./spec/fixures/comments.yml'))

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('comments') do
  USER_ID.each do |user_id|
    comments_found = Taaze::TaazeComments.new(user_id).comments

    describe "Get all the comments with specific user's id" do
      it 'has the right number of comments' do
        comments_found.size.must_equal comments_from_file[user_id].size
      end

      comments_found.map do |comment|
        it 'finds comments in the test comments' do
          exist = comments_from_file[user_id].include? comment
          [comment, exist].must_equal [comment, true]
        end
      end
    end
  end
end
