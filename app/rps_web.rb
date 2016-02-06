require 'sinatra/base'
require 'shotgun'
require '../lib/player'
require '../lib/game'
require '../lib/computer'

class Rock_Paper_Scissors < Sinatra::Base

  enable :sessions

  get '/' do
    @game = Game.new
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/result' do
    result = @game.result(params[:rps_result])
    redirect('/winner')
  end

  get '/winner' do
    erb(:winner)
  end
  run! if app_file == $0
end
