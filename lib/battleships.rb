require 'sinatra/base'

class BattleShips < Sinatra::Base
set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    # 'Hello BattleShips!'
    erb :index
  end

  get '/newgame' do
  	puts params.inspect
    @first_name = params[:first] unless params[:first] == ""
    @second_name = params[:second]  unless params[:second] == ""
    erb :newgame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
