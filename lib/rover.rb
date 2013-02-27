require 'active_support/inflector'

class Rover

  include ActiveSupport::Inflector

  COMMAND_VALUES = %w{L R M}

  def initialize(x, y, c)
    @position = Position.new(x, y, c)
  end

  def compass
    @position.compass
  end

  def location
    @position.location
  end

  def command(value)
    @position = move_factory(value).move(@position)
  end

  def position
    @position
  end

  protected

  def move_factory(command)
    raise 'Unknown command' unless COMMAND_VALUES.include?(command)
    commands = {'L' => 'Left', 'R' => 'Right', 'M' => 'Forward'}
    "Movement::#{commands[command]}".constantize
  end
end