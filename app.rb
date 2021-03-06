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

post '/mortgage' do
  @loan = params[:loan].to_i
  @apr = params[:apr].to_f
  @term = params[:term].to_i
  @uglybit = (1+@apr)**@term
  @result = @loan*((@apr*@uglybit)/@uglybit-1)
  erb :mortgage
end

post '/bmi' do
  @mass = params[:mass].to_f
  @height = params[:height].to_f
  @unit = params[:units]
  if @unit = 'kg'
    @result = @mass/(@height*@height)
  else
    @result = (@mass/(@height*@height))*703;
  end
  erb :bmi
end

post '/distance' do
  @distance = params[:distance].to_i
  @speed = params[:speed].to_i
  @cost = params[:cost].to_f
  @mpg = params[:mpg].to_f

  @time_result = @distance/@speed

  if @speed > 60
    @speedDiff = @speed - 60
    @mpg = @mpg - (2*@speedDiff)
  end

  @gallonsUsed = @distance/@mpg
  @cost_result = @gallonsUsed*@cost
  erb :distance
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

