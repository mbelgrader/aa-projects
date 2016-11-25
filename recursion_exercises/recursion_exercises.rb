# stuff
require 'byebug'

def range(start, end_pos)
  return [] if end_pos < start
  [start] + range(start+1, end_pos)
end

def sum_arr(arr)
  return arr.first if arr.length == 1
  arr[0] + sum_arr(arr[1..-1])
end

def sum_arr_it(arr)
  arr.inject(:+)
end

def exp(b, n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp_2(b, n)
  return b if n == 0

  if n.even?
    exp(b, n / 2) * exp(b, n / 2)
  else
    (b * exp(b, (n - 1) / 2)) * (exp(b, (n - 1) / 2))
  end
end


def deep_dup(arr)
  return [arr] if arr.length == 1

  compile_arr = []
  arr.each do |el|

    if el.is_a?(Array)
      compile_arr += deep_dup(el)
    else
      compile_arr << el
    end

  end
  compile_arr
end

def fib(n)
  # debugger
  return [1] if n == 1
  base = fib(n - 1)

  if base[-2..-1]
    sum = [base[-2..-1].inject(:+)]
  else
    sum = [base.first]
  end
  base + sum
  # fib(n - 1) + sum
end

def fibonacci_it(n)
  fibs = [1, 1]

  until fibs.length == n
    fibs << fibs[-1] + fibs[-2]
  end

  fibs
end

def perm(arr)
  # debugger
  return arr if arr.length == 1

  result = []
  arr.each do |el|
    sub_arr = arr
    while sub_arr == arr

      items = perm(arr.select { |num| num != el })
      if items.length == 1
        items_shuffled = ([el] + items).shuffle
      else
        items_shuffled = [el] + items.shuffle.flatten
      end
      sub_arr = items_shuffled
      # p sub_arr
    end
    result << sub_arr
  end

  result
end

def bsearch(arr, target)
  return nil unless arr.include?(target)

  idx = arr.length/2
  middle = arr[idx]
  left = arr[0..idx-1]
  right = arr[idx+1..-1]

  if target == middle
    return idx
  elsif target < middle
    bsearch(left, target)
  else
    return_value = bsearch(right, target) || nil
    return nil if return_value.nil?
    idx + return_value + 1
  end


end


def merge_sort(arr)
  return arr if arr.length <= 1
  # debugger
  idx = arr.length/2

  merge( merge_sort(arr[0..idx-1]), merge_sort(arr[idx..-1]))

end

def merge(arr1, arr2)
  new_array = []
  p "arr1 = #{arr1}"
  p "arr2 = #{arr2}"

  arr3 = arr2
  arr1.each do |el|

    arr2.each do |el2|
      # debugger if el == 999 && new_array == [1, 7]
      if el >= el2
        #### need to fix this!
        new_array << arr3.shift
      end

    end

    new_array << el
  end
  # p "new_array is #{new_array}"
  # p arr2[-i..-1]
  new_array += arr3
  new_array
end



if __FILE__ == $PROGRAM_NAME
  p merge_sort([3,6, 2,4,7, 999, 1, 13, 17])
  # p perm([1,2,3,4])
end
