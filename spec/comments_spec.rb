require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

USER_ID = %w(12522728 13193872)
comments_from_file = YAML.load(File.read('./spec/testfiles/comments.yml'))

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
