require_relative 'sudoku'
require_relative 'solver'

TYPE_TO_CLASS = {
  'base' => Sudoku::Base,
  'diagonal' => Sudoku::Diagonal,
  'asterisk' => Sudoku::Asterisk
}

def load(type = 'base')
  puts "TYPE: #{type}"
  puts '======='
  data = File.open("src/#{type}.json").read
  TYPE_TO_CLASS[type].from_json(data)
end

def bm_solve(sudoku)
  puts sudoku

  t_start = Time.now
  puts "Start at #{t_start}"

  res = Solver.solve(sudoku)
  t_end = Time.now

  puts res || 'Unsolveable'
  puts "Time #{t_end - t_start}s"
  puts '-------'
end

bm_solve(load('base'))
bm_solve(load('diagonal'))
bm_solve(load('asterisk'))
