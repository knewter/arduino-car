require 'rubygems'
require 'sinatra'
require 'haml'
require './car.rb'

DEVICE = '/dev/rfcomm0'
SPEED = 115200

get '/' do
  haml :index
end

get '/circle' do
  haml :circle
end

get '/drive' do
  puts params.inspect
  @car = Car.new(DEVICE)
  @car.drive params["x"], params["y"]
end

get '/forward' do
  @car = Car.new(DEVICE)
  @car.forward
end

get '/backward' do
  @car = Car.new(DEVICE)
  @car.backward
end

get '/left' do
  @car = Car.new(DEVICE)
  @car.left
end

get '/right' do
  @car = Car.new(DEVICE)
  @car.right
end


