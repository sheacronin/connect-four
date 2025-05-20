# frozen_string_literal: true

# Board to place tokens on
class Board
  def initialize(row_length = 6, col_length = 7)
    @row_length = row_length
    @col_length = col_length
    @grid = Array.new(row_length) { Array.new(col_length, nil) }
  end

  def show_grid
    @grid.each { |row| p row }
  end

  def place_token(row, col)
    @grid[row][col] = '◍'
  end

  def any_four_in_a_row?
    lines.any? { |line| four_in_a_row?(line) }
  end

  private

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

  def lines
    rows + cols + diagonals
  end

  def rows
    @grid
  end

  def cols
    cols = Array.new(@col_length) { [] }
    rows.each do |row|
      row.each_with_index do |space, i|
        cols[i] << space
      end
    end
    cols
  end

  def diagonals
    get_diagonals(ascending_diags_sum_range) + get_diagonals(descending_diags_sum_range)
  end

  def get_diagonals(sum_range)
    diagonals = []
    sum_range.each do |row_col_sum|
      diagonal = []
      (0...@row_length).each do |row|
        col = row - row_col_sum
        diagonal << @grid[row][col] if col.between?(0, @col_length - 1)
      end
      diagonals << diagonal
    end
    diagonals
  end

  def ascending_diags_sum_range
    0..(@row_length - 1 + @col_length - 1)
  end

  def descending_diags_sum_range
    -(@col_length - 1)..(@row_length - 1)
  end
end
