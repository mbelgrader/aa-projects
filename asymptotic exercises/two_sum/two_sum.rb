

def bad_two_sum?(arr, target)
  arr.combination(2).to_a.any? { |first, second| first + second == target }
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6) == true
bad_two_sum?(arr, 10) == false

def okay_two_sum?(arr, target)
  arr.sort!
  (0...(arr.length - 1)).each do |start|
    return true if arr[start] + arr[start + 1] == target
    return false if arr[start] + arr[start + 1] > target
  end
  false
end

arr = [0, 1, 5, 7]
okay_two_sum?(arr, 6) == true
okay_two_sum?(arr, 10) == false

def good_two_sum?(arr, target)
  hash = Hash.new
  arr.each do |num|
    return true if hash[target - num]
    hash[num] = true
  end
  false
end

arr = [0, 1, 5, 7]
good_two_sum?(arr, 6) == true
good_two_sum?(arr, 10) == false
