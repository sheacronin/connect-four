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
    context 'when the column is empty' do
      it 'places the token at the bottom' do
        board.place_token(3)
        expect(board.instance_variable_get(:@grid)).to eq([
                                                            [nil, nil, nil, nil, nil, nil, nil],
                                                            [nil, nil, nil, nil, nil, nil, nil],
                                                            [nil, nil, nil, nil, nil, nil, nil],
                                                            [nil, nil, nil, nil, nil, nil, nil],
                                                            [nil, nil, nil, nil, nil, nil, nil],
                                                            [nil, nil, nil, '◍', nil, nil, nil]
                                                          ])
      end
    end

    context 'when other tokens are in the column' do
      before do
        board.instance_variable_set(:@grid, [
                                      [nil, nil, nil, nil, nil, nil, nil],
                                      [nil, nil, nil, nil, nil, nil, nil],
                                      [nil, nil, nil, nil, nil, nil, nil],
                                      [nil, nil, nil, nil, '◍', nil, nil],
                                      [nil, nil, nil, nil, '◍', nil, nil],
                                      [nil, nil, nil, nil, '◍', nil, nil]
                                    ])
      end

      it 'places the token above the highest token in the column' do
        board.place_token(4)
        expect(board.instance_variable_get(:@grid)).to eq([
                                                            [nil, nil, nil, nil, nil, nil,
                                                             nil],
                                                            [nil, nil, nil, nil, nil, nil,
                                                             nil],
                                                            [nil, nil, nil, nil, '◍', nil,
                                                             nil],
                                                            [nil, nil, nil, nil, '◍', nil,
                                                             nil],
                                                            [nil, nil, nil, nil, '◍', nil,
                                                             nil],
                                                            [nil, nil, nil, nil, '◍', nil,
                                                             nil]
                                                          ])
      end
    end
  end

  describe '#any_winning_sequence?' do
    it 'returns false when there is not a winning sequence' do
      expect(board.any_winning_sequence?).to be(false)
    end

    it 'returns true when there is a winnning sequence horizontally' do
      board.instance_variable_set(:@grid, [
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, '◍', '◍', '◍', '◍'],
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, nil, nil, nil]
                                  ])
      expect(board.any_winning_sequence?).to be(true)
    end

    it 'returns true when there is a winnning sequence vertically' do
      board.instance_variable_set(:@grid, [
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    ['◍', nil, nil, nil, nil, nil, nil],
                                    ['◍', nil, nil, nil, nil, nil, nil],
                                    ['◍', nil, nil, nil, nil, nil, nil],
                                    ['◍', nil, nil, nil, nil, nil, nil]
                                  ])
      expect(board.any_winning_sequence?).to be(true)
    end

    it 'returns true when there is a winnning sequence diagonally' do
      board.instance_variable_set(:@grid, [
                                    [nil, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, '◍', nil, nil, nil],
                                    [nil, nil, '◍', nil, nil, nil, nil],
                                    [nil, '◍', nil, nil, nil, nil, nil],
                                    ['◍', nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, nil, nil, nil]
                                  ])
      expect(board.any_winning_sequence?).to be(true)
    end
  end
end
