def first_anagram?(first, second)
  anagrams = first.chars.permutation.to_a
  anagrams.include?(second.chars)
end

def second_anagram?(first, second)
  first_arr = first.chars
  second_arr = second.chars

  first_arr - second_arr == []
end

def third_anagram?(first, second)
  first.chars.sort == second.chars.sort
end

def fourth_anagram?(first, second)
  counts = Hash.new(0)

  first.chars.each { |letter| counts[letter] += 1 }
  second.chars.each { |letter| counts[letter] -= 1 }

  counts.values.all? { |val| val == 0 }
end

p fourth_anagram?('gizmo', 'sally')
p fourth_anagram?('elvis', 'lives')
