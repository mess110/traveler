require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, 'sqlite::memory:')

class Post
  include DataMapper::Resource

  property :id,    Serial
  property :title, String
end

Post.auto_migrate!
first_post = Post.new
first_post.title = "First!"
first_post.save

get "/" do
  Post.get(1).title
end
