require 'sinatra/base'

class BattleShips < Sinatra::Base
set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    # 'Hello BattleShips!'
    erb :index
  end

  get '/newgame' do
    "What's your name?"
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
