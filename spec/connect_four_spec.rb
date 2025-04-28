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
end
