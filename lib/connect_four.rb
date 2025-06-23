# frozen_string_literal: true

require_relative './board'
require_relative './game_ui'

# Game where players try to place four tokens in a row
class ConnectFour
  attr_reader :players, :round

  def initialize(players:, board: Board.new)
    @players = players
    @board = board
    @round = 1
    @ui = GameUI.new
  end

  def active_player
    index = (@round - 1) % players.length
    players[index]
  end

  def play
    column = @ui.prompt_token_placement(active_player.name)
    @board.place_token(column, active_player)
    @ui.show_token_placement(column)
    @ui.show_board(@board)

    return @ui.end_game(active_player.name) if game_over?

    @round += 1
    play
  end

  def game_over?
    @board.any_winning_sequence?
  end
end
