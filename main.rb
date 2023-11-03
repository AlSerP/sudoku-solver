require_relative 'sudoku'
require_relative 'solver'

# def set_up(sudoku)
#   sudoku = Sudoku.new
#   9.times do |y|
#     gets.chop.split(' ').each_with_index do |value, x|
#       sudoku[x, y] = value.to_i unless value == '-'
#     end
#   end
# end

# if solve(sudoku)
#   puts sudoku
# else
#   puts "unsolvable"
# end

data = File.open('src/base.json').read
sudoku = Sudoku::Base.from_json(data)
puts sudoku
puts '----'
puts Solver.solve(sudoku)
