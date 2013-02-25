require 'spec_helper'

describe Rover do
  specify "it should be initialized with coordinates and orientation" do
    position = Position.new(1, 2, 'N')
    position.location.should == [1,2]
    position.compass.should == 'N'
  end
end