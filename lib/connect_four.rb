# frozen_string_literal: true

require_relative './board'

# Game where players try to place four tokens in a row
class ConnectFour
  def initialize(board = Board.new)
    @board = board
  end

  def game_over?
    @board.any_winning_sequence?
  end
end
