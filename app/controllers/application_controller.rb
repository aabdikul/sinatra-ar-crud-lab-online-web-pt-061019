
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(title: params['title'], content: params['content'])
    redirect '/articles/:id'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

end
