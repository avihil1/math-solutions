#! /usr/bin/env ruby 

# recursion
def num_squares_in_chessboard(n)
	n = n.to_i
	return 1 if n == 1

	return n*n + (send __method__,n-1)
end

# squares diff, iter
def num_squares_in_chessboard_2(n)
	n.to_i.downto(1).reduce(0) {|sum,i| sum += i*i }
end

# number of board aquare "degreee"
def options_from_start_to_end_on_chessboard(n) 
end

puts send ARGV.shift.to_sym, *ARGV

