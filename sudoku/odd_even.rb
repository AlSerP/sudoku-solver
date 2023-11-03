module Sudoku
  class OddEven < Base
    EVEN = [2, 4, 6, 8]
    ODD = [1, 3, 5, 7, 9]

    attr_reader :mask

    def initialize
      super

      # Создание маски для понимания четных/нечетных требований
      @mask = Array.new(SIZE) { Array.new(SIZE, nil) }
    end

    def allowed_odd_even(x, y)
      return ODD if @mask[y][x] == 1

      EVEN
    end

    def allowed(x, y)
      allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y) & allowed_odd_even(x, y)
    end

    def set_mask(mask)
      @mask = []
      mask.each { |el| @mask << el.dup }

      self
    end

    def self.from_json(json)
      # Создание судоку из json
      sudoku = super

      data = JSON.parse json
      mask = data['mask']

      sudoku.set_mask mask
    end
  end
end
