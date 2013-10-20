require "rubygems"
require "bundler/setup"
require "pony"

libdir = File.dirname(__FILE__) + '/lib/*.rb'
Dir[libdir].each {|file| require file }
