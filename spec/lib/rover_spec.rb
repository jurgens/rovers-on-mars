require 'spec_helper'

describe Rover do
  specify "it should be initialized with coordinates and orientation" do
    rover = Rover.new(1, 2, 'N')
  end

  describe "it should accept a command" do
    let(:rover) { Rover.new(1, 2, 'N') }

    specify "it should raise exception if invalid command passed" do
      expect { rover.command('X') }.to raise_error
    end

    specify "when command is 'L' it should turn left" do
      expect { rover.command('L') }.to change(rover, :compass).to('W')
      expect { rover.command('L') }.not_to change(rover, :location)
    end

    specify "when command is 'L' it should turn left" do
      expect { rover.command('R') }.to change(rover, :compass).to('E')
      expect { rover.command('R') }.not_to change(rover, :location)
    end

    specify "when command is 'M' it should move forward" do
      expect { rover.command('M') }.to change(rover, :location).to([1, 3])
      expect { rover.command('M') }.not_to change(rover, :compass)
    end
  end

  describe "complex movement test" do
    specify "first path" do
      rover = Rover.new(1, 2, 'N')
      commands = 'LMLMLMLMM'
      commands.each_char do |command|
        rover.command(command)
      end
      rover.position.location.should == [1, 3]
      rover.position.compass.should == 'N'
    end

    specify "second path" do
      rover = Rover.new(3, 3, 'E')
      commands = 'MMRMMRMRRM'
      commands.each_char do |command|
        rover.command(command)
      end
      rover.position.location.should == [5, 1]
      rover.position.compass.should == 'E'
    end
  end
end
