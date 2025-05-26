# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  it 'initializes with a 7x6 grid' do
    expect(board.instance_variable_get(:@grid)).to eq([
                                                        [nil, nil, nil, nil, nil, nil, nil],
                                                        [nil, nil, nil, nil, nil, nil, nil],
                                                        [nil, nil, nil, nil, nil, nil, nil],
                                                        [nil, nil, nil, nil, nil, nil, nil],
                                                        [nil, nil, nil, nil, nil, nil, nil],
                                                        [nil, nil, nil, nil, nil, nil, nil]
                                                      ])
  end

  describe '#place_token' do
    it 'places a token in a space' do
      board.place_token(2, 2)
      expect(board.instance_variable_get(:@grid)).to eq([
                                                          [nil, nil, nil, nil, nil, nil, nil],
                                                          [nil, nil, nil, nil, nil, nil, nil],
                                                          [nil, nil, '◍', nil, nil, nil, nil],
                                                          [nil, nil, nil, nil, nil, nil, nil],
                                                          [nil, nil, nil, nil, nil, nil, nil],
                                                          [nil, nil, nil, nil, nil, nil, nil]
                                                        ])
    end
  end

  describe '#any_winning_sequence?' do
    it 'returns false when there is not a winning sequence' do
      board.place_token(0, 0)
      expect(board.any_winning_sequence?).to be(false)
    end

    it 'returns true when there is a winnning sequence horizontally' do
      board.place_token(0, 0)
      board.place_token(0, 1)
      board.place_token(0, 2)
      board.place_token(0, 3)
      expect(board.any_winning_sequence?).to be(true)
    end

    it 'returns true when there is a winnning sequence vertically' do
      board.place_token(2, 5)
      board.place_token(3, 5)
      board.place_token(4, 5)
      board.place_token(5, 5)
      expect(board.any_winning_sequence?).to be(true)
    end

    it 'returns true when there is a winnning sequence diagonally' do
      board.place_token(1, 0)
      board.place_token(2, 1)
      board.place_token(3, 2)
      board.place_token(4, 3)
      expect(board.any_winning_sequence?).to be(true)
    end
  end
end
