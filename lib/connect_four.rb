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
    @grid[row][col] = '◍'
  end

  def game_over?
    return true if grid.any? do |row|
      tokens_with_index = row.each_with_index.reject do |space, i|
        space.nil?
      end

      current_index = nil
      tokens_in_a_row = 0
      tokens_with_index.each do |_token, i|
        tokens_in_a_row += 1 if current_index == i - 1
        return true if tokens_in_a_row == 3

        current_index = i
      end

      false
    end

    false
  end
end
