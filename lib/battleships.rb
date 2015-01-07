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
   
    @player1 = Player.new
    @player2 = Player.new

    session[:player] = @player1.object_id
    session[:player2] = @player2.object_id
    @player1.name = params[:first]
    @player2.name = params[:second]
    GAME.add_player(@player1)
    GAME.add_player(@player2)
    puts GAME.inspect
    
    erb :newgame
  end

  get '/battle' do
    @first_name = session[:first]
    # puts "====" * 20
		@current_player = GAME.turn.name
    erb :battle
  end

  post '/battle' do
  	GAME.shoots(params[:coord])
  	@current_player = GAME.turn.name
		erb :battle
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
