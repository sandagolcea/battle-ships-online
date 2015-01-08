require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'cell'
require_relative 'water'
require_relative 'board'
require_relative 'ship'

class BattleShips < Sinatra::Base

GAME = Game.new
player1_fleet = [Ship.submarine, Ship.patrol_boat]


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
    
    #Initialize boards
    @board_player1 = Board.new(Cell)
    @board_player2 = Board.new(Cell)

    #Fill boards with water
    @board_player1.grid.each {|x,y| y.content = Water.new }
    @board_player2.grid.each {|x,y| y.content = Water.new }

    #Make players
    @player1 = Player.new
    @player2 = Player.new

    #Give boards to players
    @player1.board = @board_player1
    @player2.board = @board_player2

    session[:player1] = @player1.object_id
    session[:player2] = @player2.object_id
    
    @player1.name = params[:first]
    @player2.name = params[:second]
    
    GAME.add_player(@player1)
    GAME.add_player(@player2)
    
    # puts GAME.inspect
    
    erb :newgame
  end

  get '/place_ships' do
  	
  	puts player1_fleet.inspect
    @first_name = session[:first]
    # puts "====" * 20
		@current_player = GAME.turn.name
    erb :place_ships
  end

  post '/place_ships' do
  	puts player1_fleet.inspect
  	ship = player1_fleet.shift
  	ship_coord = params[:ship_coord]
		GAME.current_player.board.place(ship, ship_coord.to_sym)
		@placed = "placed"
		erb :place_ships
  end

  get '/battle' do
  	puts GAME.inspect
    @first_name = session[:first]
    # puts "====" * 20
		@current_player = GAME.current_player.name
    @current_player_object = GAME.current_player
    
    puts @current_player_object.board.inspect

    erb :battle
  end

  post '/battle' do
    GAME.shoots(params[:coord].to_sym)     
  	@current_player = GAME.current_player.name
    @current_player_object = GAME.current_player

		erb :battle
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
