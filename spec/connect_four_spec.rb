# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/board'
require_relative '../lib/player'

describe ConnectFour do
  let(:board) { instance_double(Board) }
  let(:players) { Array.new(2, instance_double(Player)) }
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

    it 'places a token on the board' do
      expect(board).to receive(:place_token).with(0, 1)
      game.play
    end

    it 'checks if the game is over' do
      expect(game).to receive(:game_over?)
      game.play
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
