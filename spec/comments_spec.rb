require 'yaml'
require 'minitest/autorun'
require_relative '../lib/taaze.rb'

URL = ''
comments_from_file = YAML.load(File.read('./spec/testfiles/comments.yml'))
comments_found = Taaze.new(url).comments

describe "Get all the comments with specific user's url" do
  it 'has the right number of comments' do
    comments_found.size.must_equal comments_from_file[URL].size
  end
end
