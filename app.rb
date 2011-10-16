require 'rubygems'
require 'sinatra'

get '/slides/:file' do |file|
    content_type :html
    send_file "slides/#{file}.html"
end
