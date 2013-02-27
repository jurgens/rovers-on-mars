class Transmission
  attr_accessor :plateau
  attr_accessor :commands

  def initialize(transmission)
    lines = transmission.split(/\n/)
    self.plateau = lines.shift
    self.commands = lines
  end

  def plateau=(value)
    raise 'Invalid input: no plateau size' if value.nil? || value.length < 3
    @plateau = value.split(' ').map{|e| e.to_i}
    raise 'Invalid plateau size' if @plateau.length != 2
  end

  def commands=(value)
    @commands = []
    raise 'Invalid commands' unless value.length % 2 == 0
    value.each_slice(2).each do |command|
      @commands << {position: command[0], movements: command[1]}
    end
  end
end