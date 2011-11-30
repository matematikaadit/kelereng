require "./kelereng"

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
	describe "#deletion" do
		it "should have deleted for max" do
			input = "a" * 100
			track = Track.new(input, 5)
			track.shoot(1)
			track.input.should == ""
			
			input = "a" * 4
			track = Track.new(input, 5)
			track.shoot(1)
			track.input.should == ""
			
			input = "a" * 5
			track = Track.new(input, 5)
			track.shoot(1)
			track.input.should == ""
		end
		it "should have deleted middle for max" do
			input = "a" * 5 + "b" * 99 + "c" * 9
			track = Track.new(input, 100)
			track.shoot(6)
			track.input.should == "a" * 5 + "c" * 9

			track = Track.new(input, 100)
			track.shoot(100)
			track.input.should == "a" * 5 + "c" * 9

			track = Track.new(input, 100)
			track.shoot(104)
			track.input.should == "a" * 5 + "c" * 9
		end
		describe "should not affect others (for default)" do
			it "one that in the left"
			it "one that in the right"
			it "one that in the first"
			it "one that in the last"
		end
	end

	describe "#merging" do
		describe "merging whenever possible" do
			it "should do it"
		end
		describe "not merging for both end" do
			it "should do it"
		end
	end
end

# vim:ts=2:nu:
