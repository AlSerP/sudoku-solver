require_relative 'sudoku'
require_relative 'solver'

TYPE_TO_CLASS = {
  'base' => Sudoku::Base,
  'diagonal' => Sudoku::Diagonal
}

def load(type = 'base')
  data = File.open("src/#{type}.json").read
  TYPE_TO_CLASS[type].from_json(data)
end

def bm_solve(sudoku)
  puts sudoku
  puts '======='

  t_start = Time.now
  puts "Start at #{t_start}"

  res = Solver.solve(sudoku)
  t_end = Time.now

  puts res || 'Unsolveable'
  puts "Time #{t_end - t_start}s"
end

bm_solve(load('base'))
bm_solve(load('diagonal'))
