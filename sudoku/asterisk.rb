module Sudoku
  class Asterisk < Base
    ASTERISK_IDS = [
      [2, 2], [4, 1], [6, 2],
      [1, 4], [4, 4], [7, 4],
      [2, 6], [4, 7], [6, 6]
    ]

    def asterisk
      fields = []
      ASTERISK_IDS.each do |id|
        fields << self[id[0], id[1]]
      end

      fields
    end

    def allowed_in_asterisk(x, y)
      return (NUMBERS - asterisk).uniq << nil if ASTERISK_IDS.include? [x, y]

      NUMBERS
    end

    def allowed(x, y)
      allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y) & allowed_in_asterisk(x, y)
    end
  end
end
