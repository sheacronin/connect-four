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

  def play
    prompt_token
    column = $stdin.gets.chomp.to_i
    @board.place_token(column, active_player)

    puts "You have placed your token in column #{column}."
    @board.show_grid

    return end_game if game_over?

    @round += 1
    play
  end

  def game_over?
    @board.any_winning_sequence?
  end

  private

  def prompt_token
    puts "#{active_player.name}, it is your turn."
    puts 'In which column would you like to place your token?'
  end

  def end_game
    puts 'GAME OVER, thanks for playing!'
    puts "#{active_player.name} is the winner."
  end
end
