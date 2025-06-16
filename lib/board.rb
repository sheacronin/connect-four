# frozen_string_literal: true

# Board to place tokens on
class Board
  def initialize(row_length = 6, col_length = 7, winning_count = 4)
    @row_length = row_length
    @col_length = col_length
    @winning_count = winning_count
    @grid = Array.new(row_length) { Array.new(col_length, nil) }
  end

  def show_grid
    puts row_border
    rows.each do |row|
      row_str = '|'
      row.each do |space|
        row_str += " #{space || ' '} |"
      end
      puts row_str
      puts row_border
    end
  end

  def place_token(col, token = '◍')
    (@row_length - 1).downto(0) do |row|
      if @grid[row][col].nil?
        @grid[row][col] = token
        break
      end
    end
  end

  def any_winning_sequence?
    lines.any? { |line| winning_sequence?(line) }
  end

  private

  def winning_sequence?(line)
    counter = 0
    counting_token = nil
    line.each do |space|
      counter = 0 if space != counting_token || space.nil?
      counting_token = space
      counter += 1
      return true if counter == @winning_count
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
        col = (row - row_col_sum).abs
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

  def row_border
    '+---+---+---+---+---+---+---+'
  end
end
