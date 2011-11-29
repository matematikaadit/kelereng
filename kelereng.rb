#!/usr/bin/ruby

class Track
	attr_reader :input

	def initialize(input, max)
		@input, @max = input, max
		fill
		@removed = 0
	end

	def fill
		@track = []
		@input.scan(/(?<b>(?<a>.)\k<a>*)/) { |b, a| @track.push([a, b.length]) }
	end

	def shoot(pos)
		i = find_index(pos)
		add(i)
		check(i)
		@input = @track.inject("") { |memo, val| memo + val[0] * val[1] }
	end

	def add(i)
		@track[i][1] += 1
	end

	def find_index(pos)
		@track.each_with_index do |track, i|
			if pos > track[1]
				pos -= track[1]
			else
				return i
			end
		end
		return @track.size - 1
	end

	def remove(i)
		@removed += @track[i][1]
		@track.delete_at(i)
	end

	def check(i)
		return if @track[i][1] < @max
		remove(i)

		return if i == 0
		return if i == @track.size

		return unless merge(i, i-1)
		
		check(i-1)

	end

	def merge(a, b)
		if @track[a][0] == @track[b][0]
			@track[a][1] += @track[b][1]
			@track.delete_at(b)
		else
			false
		end
	end

end

# vim:ts=2:nu:
