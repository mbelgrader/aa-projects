require 'benchmark'


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_quadratic(list)
  number_hash = {}
  (0...(list.length-1)).each do |start|
    number_hash[list[start]] = true
    (start+1...list.length).each do |finish|
      number_hash[list[start]] = false if list[start] > list[finish]
    end
  end
  number_hash.each do |k, v|
    return k if v
  end
end

my_min_quadratic(list) == -5


def my_min_linear(list)
  min = list.first
  (1...list.length).each { |idx| min = list[idx] if min > list[idx] }
  min
end
my_min_linear(list) == -5

list = (0..9999).to_a.shuffle!

Benchmark.bm do |x|
  x.report { my_min_quadratic(list) }
  x.report { my_min_linear(list) }
end

arr = (0..9999).to_a.shuffle!

def largest_contiguous_subsum(list)
  n = list.length
  combinations = []
  n.times do |i|
    combinations += list.combination(i).to_a
  end
  sums = combinations.map { |subset| subset.inject(0,&:+) }
  sums.max
end

#O(n) linear time
#O(1) constant space
def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr[1..-1].each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end

Benchmark.bm do |x|
  x.report { largest_contiguous_subsum(arr) }
  x.report { largest_contiguous_subsum2(arr) }
end
