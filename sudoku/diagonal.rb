# Диагональное судоку

module Sudoku
  class Diagonal < Base
    def main_diagonal
      diagonal = []
      # print @board[0, 0], "\n" unless @board[0, 0].empty?
      9.times { |x| diagonal << self[x, x] }

      diagonal
    end

    def side_diagonal
      diagonal = []
      9.times { |x| diagonal << self[x, 8 - x] }

      diagonal
    end

    def allowed_in_main_diagonal(x, y)
      return (NUMBERS - main_diagonal).uniq << nil if x == y

      NUMBERS
    end

    def allowed_in_side_diagonal(x, y)
      return (NUMBERS - side_diagonal).uniq << nil if (x + y) == 8

      NUMBERS
    end

    def allowed(x, y)
      allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y) & allowed_in_main_diagonal(x, y) & allowed_in_side_diagonal(x, y)
    end
  end
end
