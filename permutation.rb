#!/usr/bin/env ruby

#!/usr/bin/env ruby

require 'benchmark'

def permutation arr
  return [arr] if arr.size <= 1

  arr.each_with_index.reduce([]){|in_arr, (_,i)|
    in_arr += permutation( arr.drop(1) ).map{|a| a.insert(i, arr[0]) }
  }
end


def riddle input
  permutation(input).max_by {|a| a[0] * (10*a[1] + a[2]) * (100*a[3] + 10*a[4] + a[5]) }
  # ruby (c) native: input.permutation.max_by {|a| a[0] * (10*a[1] + a[2]) * (100*a[3] + 10*a[4] + a[5]) }
end

input = [1,2,3,4]
#permutation input
riddle input
