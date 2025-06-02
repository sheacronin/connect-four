# frozen_string_literal: true

require_relative './board'

# Game where players try to place four tokens in a row
class ConnectFour
  attr_reader :players

  def initialize(players:, board: Board.new)
    @players = players
    @board = board
  end

  # Play game
  # who's turn is it?
  # they select a space to place a token (change this later to drop)
  # check for game over?
  # if not, change whose turn and continue play
  # if yes, handle game over
  def play
    column = $stdin.gets.chomp.to_i
    @board.place_token(column)
    @board.show_grid
    game_over?
  end

  def game_over?
    @board.any_winning_sequence?
  end
end
