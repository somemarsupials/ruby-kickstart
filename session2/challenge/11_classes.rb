# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.


class Integer
	# Convert an integer to an English number.
	def to_proper
		conversions = {
			0  => "zero",
			1  => "one",
			2  => "two",
			3  => "three",
			4  => "four",
			5  => "five",
			6  => "six",
			7  => "seven",
			8  => "eight",
			9  => "nine",
			10 => "ten",
			11 => "eleven",
			12 => "twelve",
			13 => "thirteen",
			14 => "fourteen",
			15 => "fifteen",
			16 => "sixteen",
			17 => "seventeen",
			18 => "eighteen",
			19 => "nineteen",
			20 => "twenty",
			30 => "thirty",
			40 => "forty",
			50 => "fifty",
			60 => "sixty",
			70 => "seventy",
			80 => "eighty",
			90 => "ninety",
		}
		return conversions[self] if self < 20
		tens = conversions[(self/10) * 10]
		if self % 10 == 0
			tens
		else
			ones = conversions[self % 10]
			tens + "-" + ones
		end
	end
end


class BeerSong

	# set number of bottles within proper limits
	def initialize(bottles)
		@bottles = case
							 when bottles < 0
							   0
							 when bottles > 99
							   99
							 else
								 bottles
							 end
	end

	# Print @bottles verses of the bottle song.
	def print_song
		Array(1..@bottles).reverse.each { |n| verse(n) }
	end

	# Make a single line of the bottle song.
	def verse(n)
		before = bottles_as_str(n) 
		after = bottles_as_str(n-1)
		puts "#{before} of beer on the wall,",
			   "#{before} of beer,",
			   "Take one down, pass it around,",
			   "#{after} of beer on the wall."
	end

	# Convert an integer to a number of bottles, in English. 
	# For example, 4 => "Four bottles". The number of bottles is 
	# always capitalised.
	def bottles_as_str(i)
		"#{i.to_proper.capitalize} #{i == 1 ? "bottle" : "bottles"}"
	end

end

