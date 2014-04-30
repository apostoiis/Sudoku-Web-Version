require 'sinatra' # load sinatra
require_relative './lib/sudoku'
require_relative './lib/cell'

enable :sessions
set :session_secret, '*&(^B234'

def random_sudoku
  seed = (1..9).to_a.shuffle + Array.new(81-9, 0)
  sudoku = Sudoku.new(seed.join)
  sudoku.solve!
  sudoku.to_s.chars
end

# this method removes some digits from the solution to create a puzzle
def puzzle(sudoku,difficulty=2)
  sudoku.each_with_index do 
  	|number, index| 
  	if rand(difficulty) == 1 then sudoku[index] = 0 end
  end
end

get '/' do
  sudoku = random_sudoku
  session[:solution] = sudoku
	@current_solution = puzzle(sudoku)
	erb :index
end

get '/last-visit' do
	"Previous visit to homepage: #{session[:last_visit]}"
end 

get '/solution' do
  @current_solution = session[:solution]
  erb :index
end
