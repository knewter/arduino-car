require 'rubygems'
require 'sinatra'
require 'haml'
require './car.rb'

@device = '/dev/tty.FireFly-A4C7-SPP'

get '/' do
  haml :index
end

get '/circle' do
  haml :circle
end

get '/drive' do
  puts params.inspect
  @car = Car.new(@device)
  @car.drive params["x"], params["y"]
end

get '/forward' do
  @car = Car.new(@device)
  @car.forward
end

get '/backward' do
  @car = Car.new(@device)
  @car.backward
end

get '/left' do
  @car = Car.new(@device)
  @car.left
end

get '/right' do
  @car = Car.new(@device)
  @car.right
end


