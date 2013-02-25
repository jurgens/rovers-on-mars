module Moves
  class Left
    def self.move(position)
      new_position = position.clone
      index = Position::COMPASS_VALUES.find_index(position.compass)
      new_index = (4 + (index - 1)) % 4
      new_position.compass = Position::COMPASS_VALUES[new_index]
      new_position
    end
  end
end