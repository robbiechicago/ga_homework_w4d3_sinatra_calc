require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

post '/calculate' do
  @num1 = params[:num1].to_i
  @num2 = params[:num2].to_i
  # binding.pry
  case params[:op]
  when 'plus' then @result = @num1 + @num2
  when 'minus' then @result = @num1 - @num2
  when 'divide' then @result = @num1 / @num2
  when 'multiply' then @result = @num1 * @num2
  end
  erb :basic
end



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

