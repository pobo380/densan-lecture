require 'rubygems'
require 'sinatra'

get '/' do
  'Under construction...'
end

get '/slides/:file' do |file|
  content_type :html
  send_file "slides/#{file}.html"
end
