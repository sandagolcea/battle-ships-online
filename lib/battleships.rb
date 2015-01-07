require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class BattleShips < Sinatra::Base

GAME = Game.new

set :views, Proc.new { File.join(root, "..", "views") }
  
  enable :sessions

  get '/' do
    session[:game] = GAME
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  post '/newgame' do
    @first_name = params[:first] unless params[:first] == ""
    @second_name = params[:second]  unless params[:second] == ""
    
    session[:first] = params[:first]
    # @player = Player.new
    # session[:me] = @player.object_id
    # player.name = params[:first]
    # GAME.add_player(player)
    # puts GAME.inspect
    # redirect '/battle'
    erb :newgame
  end

  get '/battle' do
    @first_name = session[:first]
    # puts "====" * 20
    puts @first_name
    erb :battle
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
