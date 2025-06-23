# frozen_string_literal: true

require 'colorize'

# One playing the game with their own info and token color
class Player
  def initialize(name:, token: '◍', color: :yellow)
    @name = name
    @token = token
    @color = color
  end

  def name
    @name.colorize(@color)
  end

  def to_s
    @token.colorize(@color)
  end
end
