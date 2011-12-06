require "sinatra"
require "sinatra/activerecord"
require "haml"

class Posts < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title, :content, :cats_id
end

get '/' do
  @posts = Posts.find(:all, :conditions => { :cats_id => 1 })
  erb :index
end

post '/' do
  @post = Posts.new do |p|
    p.title = params[:title]
    p.content = params[:content]
    p.video = params[:video]
    p.cats_id = params[:cats_id]
  end
  
  @post.save!
  
  redirect "/"
  
end

get '/admin' do
  haml :admin
end

