# frozen_string_literal: true

require_relative './board'

# Game where players try to place four tokens in a row
class ConnectFour
  attr_reader :players, :round

  def initialize(players:, board: Board.new)
    @players = players
    @board = board
    @round = 1
  end

  def active_player
    index = (@round - 1) % players.length
    players[index]
  end

  # Play game
  # who's turn is it?
  # they select a space to place a token (change this later to drop)
  # check for game over?
  # if not, change whose turn and continue play
  # if yes, handle game over
  def play
    puts "#{active_player.name}, it is your turn."
    puts 'In which column would you like to place your token?'
    column = $stdin.gets.chomp.to_i
    @board.place_token(column, active_player)

    puts "You have placed your token in column #{column}."
    @board.show_grid

    return end_game if game_over?

    @round += 1
    play
  end

  def end_game
    puts 'GAME OVER, thanks for playing!'
  end

  def game_over?
    @board.any_winning_sequence?
  end
end
