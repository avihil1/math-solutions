#!/usr/bin/env ruby

#!/usr/bin/env ruby

require 'benchmark'

def permutation arr
  return [arr] if arr.size <= 1

  arr.each_with_index.reduce([]){|in_arr, (_,i)|
    in_arr += permutation( arr.drop(1) ).map{|a| a.insert(i, arr[0]) }
  }
end

def permutation_iter arr
	final_arr = [arr.last(2), arr.last(2).reverse].uniq
	current_inject_count = 2
	(arr.size - 3).downto(0).each {|i|
	  temp_arr = []
	  current_inject_count.downto(0).each{|place|
			 temp_arr += final_arr.map{|in_arr| in_arr.dup.insert(place, arr[i]) }
	  }
		current_inject_count += 1
		final_arr = temp_arr
	}
	final_arr
end

def riddle input
  permutation(input).max_by {|a| a[0] * (10*a[1] + a[2]) * (100*a[3] + 10*a[4] + a[5]) }
end

def riddle_native input
  res = input.permutation.max_by {|a| a[0] * (10*a[1] + a[2]) * (100*a[3] + 10*a[4] + a[5]) }
  "#{res[0]} * #{res[1]}#{res[2]} * #{res.last(3).join}"
end

input = [1,2,3,4,5,6,7,8,9]
p " ====== permutation ====== "
Benchmark.bm(2) { |bm|
  bm.report("recursion:") { permutation input }
  bm.report("iterative:") { permutation_iter input }
  bm.report("native:   ")     { input.permutation }
}
puts " ====== riddle ====== "
input = [1,2,3,4,5,6]
p riddle_native input

