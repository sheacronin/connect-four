# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/board'

describe ConnectFour do
  let(:board) { instance_double(Board) }
  subject(:game) { described_class.new(board) }

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
