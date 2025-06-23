# frozen_string_literal: true

require_relative '../lib/game_ui'
require_relative '../lib/player'
require_relative '../lib/connect_four'

ui = GameUI.new

ui.begin_game
player1_name = ui.prompt_player_name
player2_name = ui.prompt_player_name

player1 = Player.new(name: player1_name, color: :yellow)
player2 = Player.new(name: player2_name, color: :red)

game = ConnectFour.new(players: [player1, player2], ui:)

game.play
