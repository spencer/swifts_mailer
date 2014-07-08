require 'rubygems'
require 'bundler/setup'

require 'sinatra'

get '/' do
  erb :index
end

get '/preview' do
  erb :index, :layout => :nil
end
