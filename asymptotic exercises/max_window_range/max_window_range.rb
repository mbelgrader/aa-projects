array = [1, 2, 3, 5]

def naive_solution(array, window_size)
  current_max_range = nil
  (0..array.length - window_size).each do |start|
    max = array[start...start + window_size].max
    min = array[start...start + window_size].min
    current_max_range = max - min if
      current_max_range.nil? || current_max_range < max - min
  end
  current_max_range
end

naive_solution([1, 2, 3, 5], 3) == 3

naive_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
naive_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
naive_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
naive_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def intialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def max
  end

  def min
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


class StackQueue
  def initialize
    @pushing_stack = MyStack.new
    @popping_stack = MyStack.new
  end

  def enqueue(el)
    @pushing_stack.push(el)
  end

  def dequeue
    @popping_stack.push(@pushing_stack.pop) until @pushing_stack.empty?

    @popping_stack, @pushing_stack = @pushing_stack, @popping_stack

    @pushing_stack.pop
  end

  def size
    @pushing_stack.length + @popping_stack.length
  end

  def empty?
    @pushing_stack.length + @popping_stack.length == 0
  end
end


class MaxStack
  def intialize
    @store = []
    @max = nil
  end

  def push(el)
    @max = el if @max.nil? || el > @max
    @store << el
  end

  def max
    @max
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStack
  def intialize
    @store = []
    @max = nil
    @min = nil
  end

  def push(el)
    hash = { min: empty? ? el : [min, el].min, max: empty? ? el : [max, el].max }
    # @max = el if @max.nil? || el > @max
    # @min = el if @min.nil? || el < @min
    @store << hash
  end
  
  def max
    @max
  end

  def min
    @min
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  def intialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def max

  end

  def min

  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
