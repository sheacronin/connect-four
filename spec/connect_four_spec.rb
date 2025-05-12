# frozen_string_literal: true

require_relative '../lib/connect_four'

describe ConnectFour do
  subject(:game) { described_class.new }

  it 'initializes with a 7x6 grid' do
    expect(game.grid).to eq([
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil]
                            ])
  end

  it 'places a token in a space' do
    game.place_token(2, 2)
    expect(game.grid).to eq([
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, '◍', nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, nil, nil, nil]
                            ])
  end

  describe '#game_over?' do
    it 'returns false when there are not 4 tokens in a row' do
      game.place_token(0, 0)
      expect(game.game_over?).to be(false)
    end

    it 'returns true when 4 tokens are in a horizontal row' do
      game.place_token(0, 0)
      game.place_token(0, 1)
      game.place_token(0, 2)
      game.place_token(0, 3)
      expect(game.game_over?).to be(true)
    end
  end
end
