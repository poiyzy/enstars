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

post '/admin' do
  @post = Posts.new do |p|
    p.title = params[:title]
    p.content = params[:content]
    p.pic = params[:pic]
    p.video = params[:video]
    p.cats_id = params[:cats_id]
  end
  
  @post.save!
  
  redirect "/"
  
end

get '/admin' do
  @post = Posts.all
  erb :admin
end

get '/admin/:model/:action' do
  if params[:model] == "post" || params[:action] == "new"
    erb :admin_post_new
  end
end

get '/post/:id' do
  post = Posts.find(params[:id])
  post.title
end

get '/apply' do
  erb :apply
end

post '/apply' do
  @apply = Applicants.new do |a|
    a.name = params[:name]
    a.phone = params[:phone]
    a.email = params[:email]
    a.school = params[:school]
    a.grate = params[:grate]
    a.sex = params[:sex]
    a.tel = params[:tel]
    a.address = params[:address]
    a.birth = params[:birth]
    a.idcard = params[:idcard]
    a.pname = params[:pname]
  end
  
  @apply.save!
  
  redirect "/"
  
end

get '/apply/admin' do
  @apply = Applicants.all
  
  erb :applyadmin
end