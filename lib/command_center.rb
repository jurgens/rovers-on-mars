class CommandCenter

  def send(input)
    transmission = Transmission.new(input)
    transmission.commands.each do |command|
      x, y, c = command[:position].split(' ')
      rover = Rover.new(x.to_i, y.to_i, c)
      move rover, command[:movements]
      report rover
    end
  end

  def move(rover, commands)
    commands.each_char do |command|
      rover.command(command)
    end
  end

  def report(rover)
    puts rover.location.join(' ') + ' ' + rover.compass
  end
end
