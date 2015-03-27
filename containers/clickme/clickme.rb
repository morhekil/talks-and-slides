#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.require :default

set :bind, '0.0.0.0'

KEY = 'Clickme:Count'
LINK = 'REDIS_PORT_6379_TCP'

url = if ENV[LINK + '_ADDR'].to_s.empty?
        nil
      else
        "redis://#{ENV[LINK + '_ADDR']}:#{ENV[LINK + '_PORT']}/0"
      end
puts "URL: #{url}"
r = Redis.new url: url

get '/' do
  @count = r.get(KEY).to_i
  erb :index
end

post '/' do
  r.incr KEY
  redirect '/'
end

get '/env' do
  content_type 'text/plain'
  ENV.map { |k, v| "#{k}\t#{v}" }.sort.join("\n")
end
