require "spec_helper"

describe Track do
	describe "#start" do
		it "should not be nil" do
			track = Track.new("a", 2)
			track.should_not be_nil
		end	
	end
	describe "#shooting" do
		it "should shooting correct path" do
			input = "aaabbb"
			track = Track.new(input, 100)
			track.shoot(1)
			track.input.should == 'a' + input

			track = Track.new(input, 100)
			track.shoot(4)
			track.input.should == input + 'b'

			other = "cccccccc"
			track = Track.new(input + other, 100)
			track.shoot(4)
			track.input.should == input + 'b' + other
		end
	end
end

# vim:ts=2:nu:
