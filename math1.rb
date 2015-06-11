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

# next method helper
class Matrix
  def self.init!(n); @@n = n.to_i; end
  def self.down(i,j);  [i+1, j]; end
  def self.right(i,j); [i, j+1]; end
  def self.end?(i,j); i== j && j == @@n-1 ; end
  def self.valid?(i,j); i < @@n && j < @@n; end
end

# number of paths from upper-left square to the right-bottom sqaure
def options_from_start_to_end_on_chessboard(n) 
  Matrix.init!(n.to_i)
  
  def count_paths(i,j)
    return 0 if !Matrix.valid?(i,j)
    return 1 if Matrix.end?(i,j)

    return count_paths(*Matrix.down(i,j)) + count_paths(*Matrix.right(i,j))
  end

  count_paths(0,0)
end

puts send ARGV.shift.to_sym, *ARGV
