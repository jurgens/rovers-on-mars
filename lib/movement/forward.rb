module Movement
  class Forward
    def self.move(position)
      new_position = position.clone
      case position.compass
        when 'N'
          new_position.y += 1
        when 'E'
          new_position.x += 1
        when 'S'
          new_position.y -= 1
        when 'W'
          new_position.x -= 1
        else
          raise 'Invalid rover orientation'
      end
      new_position
    end
  end
end
