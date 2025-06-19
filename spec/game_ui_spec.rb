# frozen_string_literal: true

require_relative '../lib/game_ui'

describe GameUI do
  subject(:ui) { described_class.new }

  describe '#begin_game' do
    it 'outputs the beginning message' do
      expect { ui.begin_game }.to output("Welcome!\n").to_stdout
    end
  end

  describe '#prompt_player_name' do
    before do
      allow($stdin).to receive(:gets).and_return('Ronald')
    end

    it 'outputs the prompt for name' do
      expect { ui.prompt_player_name }.to output("What is your name?\n").to_stdout
    end

    it 'returns the inputted string' do
      expect(ui.prompt_player_name).to eq('Ronald')
    end
  end

  describe '#show_board' do
    it 'outputs the board as a string' do
      board = double('Board')
      expect { ui.show_board(board) }.to output("#{board}\n").to_stdout
    end
  end

  describe '#prompt_token_placement' do
    before do
      allow($stdin).to receive(:gets).and_return('2')
    end

    player_name = 'Jess'

    it 'outputs the prompt for column' do
      expect { ui.prompt_token_placement(player_name) }.to output(
        <<~TEXT
          Jess, it is your turn.
          In which column would you like to place your token?
        TEXT
      ).to_stdout
    end

    it 'returns the inputted column as an integer' do
      expect(ui.prompt_token_placement(player_name)).to eq(2)
    end

    context 'user inputs a non-integer' do
      before do
        allow($stdin).to receive(:gets).and_return('word1', '1')
      end

      it 'outputs an error message' do
        expect { ui.prompt_token_placement(player_name) }.to output(/Please input a valid column number\.+$/).to_stdout
      end
    end
  end

  describe '#end_game' do
    it 'outputs the ending message' do
      winner = 'Tammy'
      expect { ui.end_game(winner) }.to output(
        <<~TEXT
          GAME OVER, thanks for playing!
          Tammy is the winner.
        TEXT
      ).to_stdout
    end
  end
end
