require 'rubygems'
require 'sinatra'
require 'haml'
require './car.rb'

get '/' do
  haml :index
end

get '/forward' do
  @car = Car.new('/dev/rfcomm0')
  @car.forward
end

get '/backward' do
  @car = Car.new('/dev/rfcomm0')
  @car.backward
end

get '/left' do
  @car = Car.new('/dev/rfcomm0')
  @car.left
end

get '/right' do
  @car = Car.new('/dev/rfcomm0')
  @car.right
end
