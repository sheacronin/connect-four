# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/board'
require_relative '../lib/player'

describe ConnectFour do
  let(:board) { instance_double(Board) }
  let(:player1) { instance_double(Player, { name: 'Player1', token: '1' }) }
  let(:player2) { instance_double(Player, { name: 'Player2', token: '2' }) }
  let(:players) { [player1, player2] }
  subject(:game) { described_class.new(players:, board:) }

  it 'has 2 players' do
    expect(game.players).to be(players)
  end

  it 'has a board' do
    expect(game.instance_variable_get(:@board)).to be(board)
  end

  describe '#play' do
    before do
      allow($stdin).to receive(:gets).and_return('1')
      allow(board).to receive(:place_token)
      allow(board).to receive(:show_grid)
      allow(board).to receive(:any_winning_sequence?).and_return(false)
    end

    it 'changes the round' do
      expect { game.play }.to change { game.round }.from(1).to(2)
    end

    it 'sends the board the inputted column and active player to place token' do
      expect(board).to receive(:place_token).with(1, game.active_player)
      game.play
    end

    it 'checks if the game is over' do
      expect(game).to receive(:game_over?)
      game.play
    end
  end

  describe '#active_player' do
    it 'returns first player at start of game' do
      expect(game.active_player).to be(player1)
    end

    it 'returns the second player on round 2' do
      game.instance_variable_set(:@round, 2)
      expect(game.active_player).to be(player2)
    end

    it 'loops back to first player on later rounds' do
      game.instance_variable_set(:@round, 5)
      expect(game.active_player).to be(player1)
    end
  end

  describe '#game_over?' do
    it 'returns false when there is not a winning sequence' do
      allow(board).to receive(:any_winning_sequence?).and_return(false)
      expect(game.game_over?).to be(false)
    end

    it 'returns true when there is a winning sequence' do
      allow(board).to receive(:any_winning_sequence?).and_return(true)
      expect(game.game_over?).to be(true)
    end
  end
end
