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
      Moves::Left.should_receive(:move)
      rover.command('L')
    end

    specify "when command is 'L' it should turn left" do
      Moves::Right.should_receive(:move)
      rover.command('R')
    end

    specify "when command is 'M' it should move forward" do
      Moves::Forward.should_receive(:move)
      rover.command('M')
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
