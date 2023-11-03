# Классическое судоку

module Sudoku
  require 'json'

  class Base
    SIZE = 9
    NUMBERS = (1..9).to_a

    def initialize
      # Создание объекта
      @board = Array.new(SIZE) { Array.new(SIZE, nil) }
    end

    def [](x, y)
      @board[y][x]
    end

    def []=(x, y, value)
      raise "#{value} is not allowed in the row #{y}" unless allowed_in_row(y).include?(value)
      raise "#{value} is not allowed in the column #{x}" unless allowed_in_column(x).include?(value)
      raise "#{value} is not allowed in the square at #{x}, #{y}" unless allowed_in_square(x, y).include?(value)
      @board[y][x] = value
    end

    def to_s
      @board.map { |row| row.map { |x| if x.nil?; '-'; else x end }.join(' ') }.join("\n")
    end

    def row(y)
      Array.new(@board[y])
    end

    def column(x)
      @board.map { |row| row[x] }
    end

    def allowed_in_row(y)
      (NUMBERS - row(y)).uniq << nil
    end

    def allowed_in_column(x)
      (NUMBERS - column(x)).uniq << nil
    end

    def allowed_in_square(x, y)
      sx = 3 * (x / 3)
      sy = 3 * (y / 3)
      square = []

      3.times do |i|
        3.times do |j|
          square << @board[sy + j][sx + i]
        end
      end

      (NUMBERS - square).uniq << nil
    end

    def allowed(x, y)
      allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y)
    end

    def empty
      result = []

      9.times do |y|
        9.times do |x|
          result << [x, y] if self[x, y].nil?
        end
      end

      result
    end

    def solved?
      empty.empty?
    end

    def self.from_json(json)
      # Создание судоку из json
      data = JSON.parse json
      board = data['board']

      sudoku = self.new

      9.times do |y|
        9.times do |x|
          sudoku[x, y] = board[y][x]
        end
      end

      sudoku
    end
  end
end
