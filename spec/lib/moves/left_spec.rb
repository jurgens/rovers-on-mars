require 'spec_helper'

describe Moves::Left do
  specify "it should calculate new position" do
    position = Position.new(1, 1, 'N')
    new_pos = Moves::Left.move(position)
    new_pos.location.should == position.location
    new_pos.compass.should == 'W'
  end
end