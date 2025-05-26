# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new(name: 'Stephen', token: '◍') }

  it 'has a name' do
    expect(player.name).to be('Stephen')
  end

  it 'has a token' do
    expect(player.token).to be('◍')
  end
end
