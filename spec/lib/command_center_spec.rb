require 'spec_helper'

describe CommandCenter do
  specify "should send a transmission" do
    commands = '5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM'

    cc = CommandCenter.new.send(commands)
  end
end