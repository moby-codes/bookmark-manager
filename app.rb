require 'sinatra/base' # frozen_string_literal: true
require 'sinatra/reloader'


class Bookmarks < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  
  run! if app_file == $0
end
