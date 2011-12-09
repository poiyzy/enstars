require "sinatra"
require "sinatra/activerecord"
require "haml"

class Posts < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title, :content, :cats_id
end

class Applicants < ActiveRecord::Base

end

get '/' do
  @postnew = Posts.find(:all, :conditions => { :cats_id => 1 })
  @postpic = Posts.find(:all, :conditions => { :cats_id => 2 })
  @postvideo = Posts.find(:all, :conditions => { :cats_id => 3 })
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

get '/post/:id' do
  post = Posts.find(params[:id])
  post.title
end

get '/apply' do
  haml :apply
end

post '/apply' do
  @apply = Applicants.new do |a|
    a.name = params[:name]
    a.phone = params[:phone]
    a.email = params[:email]
    a.school = params[:school]
    a.grate = params[:grate]
    a.sex = params[:sex]
  end
  
  @apply.save!
  
  redirect "/"
  
end