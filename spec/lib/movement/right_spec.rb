require 'spec_helper'

describe Movement::Right do
  specify "it should calculate new position" do
    position = Position.new(1, 1, 'N')
    new_pos = Movement::Right.move(position)
    new_pos.location.should == position.location
    new_pos.compass.should == 'E'
  end
end