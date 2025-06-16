# frozen_string_literal: true

# One playing the game with their own info and token color
class Player
  attr_reader :name, :token

  def initialize(name:, token: '◍')
    @name = name
    @token = token
  end

  def to_s
    @token
  end
end
