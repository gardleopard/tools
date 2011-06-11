require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'mustache/sinatra'
require 'fileutils'

Sinatra.register Mustache::Sinatra

require 'views/layout'

set :mustache, {
  :views     => 'views/',
  :templates => 'templates/'
}

get '/' do
  mustache :upload
end

get '/upload' do
  mustache :upload
end

post '/upload' do
  tempfile  = params['file'][:tempfile]
  filename  = params['file'][:filename]
  FileUtils.cp tempfile.path, "./uploads/#{filename}"
  @filename = filename
  mustache :upload
end



























