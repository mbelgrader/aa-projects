require 'byebug'
class Array
  def my_each(&prc)
    i = 0

    while i < self.size
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    result = []
    self.my_each { |el| result << el if prc.call(el) }
    result
  end

  def my_reject(&prc)
    self - self.my_select(&prc)
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }
    true
  end

  def my_flatten
    result = []

    self.my_each do |el|
      if el.is_a?(Array)
        result.concat(el.my_flatten)
      else
        result << el
      end
    end

    result
  end

  def my_zip(*args)
    result = []

    i = 0
    while i < self.length
      sub_result = Array(self[i])

      args.my_each do |array|
        sub_result << array[i]
      end
      result << sub_result
      i += 1
    end

    result
  end

  def my_rotate(number=1)

    if number > 0
      number.times do
        el = self.shift
        self << el
      end
    else
      (number).abs.times do
        el = self.pop
        self.unshift(el)
      end
    end

    self
  end

  def my_join(seperator='')
    result = ""

    self.each_with_index do |el, i|
      result << "#{el}"
      result << "#{seperator}" unless i == self.size - 1
    end

    result
  end

  def my_reverse
    result = []
    (self.size - 1).downto(0) do |i|
      result << self[i]
    end

    result
  end

end

  # ### Factors
  #
  # Write a method `factors(num)` that returns an array containing all the
  # factors of a given number.

  # def factors(num)
  #   result = []
  #   (num.downto(1) do |el|
  #     result << el if num % el == 0
  #   end
  #   result.sort
  # end

  # ### Bubble Sort
  #
  # http://en.wikipedia.org/wiki/bubble_sort
  #
  # Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
  # modify the array so that it is in sorted order.
  #
  # > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
  # > simple sorting algorithm that works by repeatedly stepping through
  # > the list to be sorted, comparing each pair of adjacent items and
  # > swapping them if they are in the wrong order. The pass through the
  # > list is repeated until no swaps are needed, which indicates that the
  # > list is sorted. The algorithm gets its name from the way smaller
  # > elements "bubble" to the top of the list. Because it only uses
  # > comparisons to operate on elements, it is a comparison
  # > sort. Although the algorithm is simple, most other algorithms are
  # > more efficient for sorting large lists.
  #
  # Hint: Ruby has parallel assignment for easily swapping values:
  # http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
  #
  # After writing `bubble_sort!`, write a `bubble_sort` that does the same
  # but doesn't modify the original. Do this in two lines using `dup`.
  #
  # Finally, modify your `Array#bubble_sort!` method so that, instead of
  # using `>` and `<` to compare elements, it takes a block to perform the
  # comparison:
  #
  # ```ruby
  # [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
  # [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
  # ```
  #
  # #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
  # `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
  # greater, `1`. For future reference, you can define `<=>` on your own classes.
  #
  # http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

  class Array
    def bubble_sort!(&prc)
      prc ||= proc { |x,y| x <=> y }

      loop do
        sorted = true

        self.each_index do |i|
          next if self[i + 1].nil?
          if prc.call(self[i],self[i+1]) == 1
            self[i], self[i + 1] = self[i + 1], self[i]
            sorted = false
          end
        end

        break if sorted
      end
      self
    end

    def bubble_sort(&prc)
      dup.bubble_sort!(&prc)
    end
  end

  # ### Substrings and Subwords
  #
  # Write a method, `substrings`, that will take a `String` and return an
  # array containing each of its substrings. Don't repeat substrings.
  # Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
  # "t"]`.
  #
  # Your `substrings` method returns many strings that are not true English
  # words. Let's write a new method, `subwords`, which will call
  # `substrings`, filtering it to return only valid words. To do this,
  # `subwords` will accept both a string and a dictionary (an array of
  # words).

  def substrings(string)
    result = []
    i = 0

    while i < string.length
      j = i

      while j < string.length
        result << string[i..j]
        j += 1
      end

      i += 1
    end

    result.uniq
  end

  def subwords(word, dictionary)
    words = substrings(word)
    words.select { |word| dictionary.include?(word) }
  end

  # ### Doubler
  # Write a `doubler` method that takes an array of integers and returns an
  # array with the original elements multiplied by two.
