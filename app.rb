require "sinatra"
require "sinatra/activerecord"
require "haml"

class Posts < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title, :content, :cats_id
end

get '/' do
  @postnew = Posts.find(:all, :conditions => { :cats_id => 1 })
  @postpic = Posts.find(:all, :conditions => { :cats_id => 2 })
  @postvideo = Posts.find(:all, :conditions => { :cats_id => 3 })
  erb :index
end

get '/post/:id' do
  post = Posts.find(params[:id])
  post.title
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

