# frozen_string_literal: true

# Outputs game messages and takes player input
class GameUI
  def begin_game
    puts 'Welcome!'
  end

  def prompt_player_name
    puts 'What is your name?'
    $stdin.gets.chomp
  end

  def show_board(board)
    puts board
  end

  def prompt_token_placement(name)
    puts "#{name}, it is your turn."
    puts 'In which column would you like to place your token?'
    col_input = $stdin.gets.chomp
    return col_input.to_i if col_input.match(/^\d$/)

    puts 'Please input a valid column number.'
    prompt_token_placement(name)
  end

  def end_game(winner)
    puts 'GAME OVER, thanks for playing!'
    puts "#{winner} is the winner."
  end
end
