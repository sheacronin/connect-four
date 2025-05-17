# frozen_string_literal: true

# Grid to place tokens on
class ConnectFour
  attr_reader :grid

  def initialize
    @grid = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]
    ]
  end

  def place_token(row, col)
    grid[row][col] = '◍'
  end

  def game_over?
    return true if horizontal_four? || vertical_four? || diagonal_four?

    false
  end

  def show_grid
    grid.each { |row| p row }
  end

  private

  def horizontal_four?
    grid.any? { |row| four_in_a_row?(row) }
  end

  def vertical_four?
    cols = Array.new(7) { [] }
    grid.each do |row|
      row.each_with_index do |space, i|
        cols[i] << space
      end
    end

    cols.any? { |col| four_in_a_row?(col) }
  end

  def diagonal_four?
    diagonals = []

    (0..(6 + 7 - 2)).each do |row_col_sum|
      diagonal = []
      (0...6).each do |row|
        col = row_col_sum - row
        diagonal << grid[row][col] if col.between?(0, 6)
      end
      diagonals << diagonal
    end

    (-6..5).each do |row_col_sum|
      diagonal = []
      (0...6).each do |row|
        col = row - row_col_sum
        diagonal << grid[row][col] if col.between?(0, 6)
      end
      diagonals << diagonal
    end

    diagonals.any? { |diagonal| four_in_a_row?(diagonal) }
  end

  def four_in_a_row?(line)
    tokens_with_index = line.each_with_index.reject do |space, i|
      space.nil?
    end

    current_index = nil
    tokens_in_a_row = 1

    tokens_with_index.each do |_token, i|
      if current_index == i - 1
        tokens_in_a_row += 1
      else
        tokens_in_a_row = 1
      end
      return true if tokens_in_a_row == 4

      current_index = i
    end

    false
  end
end
