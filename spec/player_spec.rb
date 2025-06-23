# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new(name: 'Stephen', token: '◍', color: :yellow) }

  it 'has a name' do
    expect(player.instance_variable_get(:@name)).to be('Stephen')
  end

  it 'has a token' do
    expect(player.instance_variable_get(:@token)).to be('◍')
  end

  it 'has a color' do
    expect(player.instance_variable_get(:@color)).to be(:yellow)
  end
end
