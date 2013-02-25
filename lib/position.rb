class Position
  COMPASS_VALUES = %w{N E S W}

  attr_accessor :x, :y, :compass

  def initialize(x, y, c)
    self.x = x
    self.y = y
    self.compass = c
  end

  def location
    [@x, @y]
  end
end
