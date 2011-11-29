#!/usr/bin/ruby

class Bundle
	attr_accessor :peggle, :ammount, :status

	def initialize(peggle, ammount, status = :live)
		@peggle, @ammount, @status = peggle, ammount, status
	end

	def inspect
		"#<Bundle: #{@peggle}:#{@ammount}:#{@status}>"
	end

end

class Track

	def initialize(input, max)
		@input, @max = input, max
		fill
		@deleted = 0
	end

	def fill
		input = @input.split(//)
		@trackline = []
		until input.empty?
			if @trackline.empty? || @trackline.last.peggle != input.first
				@trackline.push Bundle.new(input.shift, 1)
			else
				@trackline.last.ammount += 1
				input.shift
			end

		end
	end

	def shoot(pos)
		i = find_index(pos)
		add(i)
		check(i)
		@input = @trackline.select { |v| v.status == :live }.inject("") { |i, v| v.peggle * v.ammount + i }.reverse
	end

	def add(i)
		@trackline[i].ammount += 1
	end

	def find_index(pos)
		@trackline.each_with_index do |track, i|
			next if track.status == :deleted
			if pos > track.ammount
				pos -= track.ammount
			else
				return i
			end
		end
		return @trackline.size - 1
	end

	def check(i)
		return if @trackline[i].ammount < @max
		@trackline[i].status = :deleted
		@deleted += @trackline[i].ammount

		left = left_live(i)
		right = right_live(i)
		if left == false || right == false
			return
		end

		return if @trackline[left].peggle != @trackline[right].peggle
		@trackline[left].ammount += @trackline[right].ammount
		@trackline[right].status = :deleted
		
		check(left)

	end

	def left_live(i)
		i -= 1
		while i > 0
			return i if @trackline[i].status == :live
			i -= 1
		end
		return false 
	end

	def right_live(i)
		i += 1
		while i < @trackline.size - 1
			return i if @trackline[i].status == :live
			i += 1
		end
		return false
	end


end


