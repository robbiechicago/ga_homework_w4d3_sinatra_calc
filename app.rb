require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  @title = 'Basic'
  erb :basic
end

get '/mortgage' do
  @title = 'mortgage'
  erb :mortgage
end

get '/bmi' do
  @title = 'bmi'
  erb :bmi
end

get '/distance' do
  @title = 'distance'
  erb :distance
end

