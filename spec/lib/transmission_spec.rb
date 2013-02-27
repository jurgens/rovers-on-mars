require 'spec_helper'

describe Transmission do
  let(:valid_input) {'5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM'
  }

  let(:invalid_input) {
    'sergtsrtert'
  }

  context "when input is valid" do
    specify 'constructor should parse input' do
      transmission = Transmission.new(valid_input)
      transmission.plateau.should == [5, 5]
      transmission.commands.length.should == 2
    end
  end

  context "when input is not valid" do
    specify 'constructor should raise exception' do
      expect { Transmission.new(invalid_input) }.to raise_error
    end
  end
end