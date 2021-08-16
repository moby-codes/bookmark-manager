# frozen_string_literal: true

require 'sinatra/base' # frozen_string_literal: true
require 'sinatra/reloader'
require_relative './lib/bookmark'

# enabling Sinatra Base in bookmarks
class Bookmarks < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/bookmarks' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bm = Bookmark.all
    erb :bookmarks
  end


  run! if app_file == $PROGRAM_NAME
end
