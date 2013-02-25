require 'spec_helper'

describe Moves::Forward do
  context "when orientation is  North" do
    specify "it should move up" do
      position = Position.new(1, 1, 'N')
      new_pos = Moves::Forward.move(position)
      new_pos.compass.should == position.compass
      new_pos.location.should == [1, 2]
    end
  end

  context "when orientation is West" do
    specify "it should move left" do
      position = Position.new(1, 1, 'W')
      new_pos = Moves::Forward.move(position)
      new_pos.compass.should == position.compass
      new_pos.location.should == [0, 1]
    end
  end
end