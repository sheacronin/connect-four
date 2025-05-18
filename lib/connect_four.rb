# frozen_string_literal: true

# Grid to place tokens on
class ConnectFour
  attr_reader :grid, :row_length, :col_length

  def initialize(row_length = 6, col_length = 7)
    @row_length = row_length
    @col_length = col_length
    @grid = Array.new(row_length) { Array.new(col_length, nil) }
    # Looks like:
    # [
    #   [nil, nil, nil, nil, nil, nil, nil],
    #   [nil, nil, nil, nil, nil, nil, nil],
    #   [nil, nil, nil, nil, nil, nil, nil],
    #   [nil, nil, nil, nil, nil, nil, nil],
    #   [nil, nil, nil, nil, nil, nil, nil],
    #   [nil, nil, nil, nil, nil, nil, nil]
    # ]
  end

  def place_token(row, col)
    grid[row][col] = '◍'
  end

  def game_over?
    return true if lines.any? { |line| four_in_a_row?(line) }

    false
  end

  def show_grid
    grid.each { |row| p row }
  end

  private

  def lines
    rows + cols + diagonals
  end

  def rows
    grid
  end

  def cols
    cols = Array.new(col_length) { [] }
    rows.each do |row|
      row.each_with_index do |space, i|
        cols[i] << space
      end
    end
    cols
  end

  def diagonals
    get_diagonals(0..(row_length - 1 + col_length - 1)) + get_diagonals(-(col_length - 1)..(row_length - 1))
  end

  def get_diagonals(sum_range)
    diagonals = []
    sum_range.each do |row_col_sum|
      diagonal = []
      (0...row_length).each do |row|
        col = row - row_col_sum
        diagonal << grid[row][col] if col.between?(0, col_length - 1)
      end
      diagonals << diagonal
    end
    diagonals
  end

  def four_in_a_row?(line)
    counter = 0
    line.each do |space|
      if space.nil?
        counter = 0
      else
        counter += 1
        return true if counter == 4
      end
    end
    false
  end
end
