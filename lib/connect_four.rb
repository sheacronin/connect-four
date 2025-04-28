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
end
