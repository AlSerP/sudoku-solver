class Solver
  class << self
    def solve(sudoku)
      # Запуск решения судоку
      return sudoku if step(sudoku)

      nil
    end

    private

    def step(sudoku)
      # Проверяем решено ли судоку
      return true if sudoku.solved?

      # Находим первую пустую ячейку
      x, y = sudoku.empty.first

      # Находим все возможные цифры для ячейки
      allowed = sudoku.allowed(x, y).compact

      # Пробуем все возможные варианты подстановки
      until allowed.empty?
        sudoku[x, y] = allowed.shift

        begin
          # Переходим к следующей ячейки
          return true if step(sudoku)
        rescue Exception => e
        end

        sudoku[x, y] = nil
      end

      # Если перебрали все варианты, но не решили
      # то возвращаем false
      false
    end
  end
end
