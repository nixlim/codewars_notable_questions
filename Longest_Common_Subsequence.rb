#Longest Common Subsequence
# https://www.codewars.com/kata/longest-common-subsequence/ruby
# Write a function called LCS that accepts two sequences and returns the longest subsequence common to the passed in sequences.

def lcs(x, y)
  first_sequence_array = x.split("")
  second_sequence_array = y.split("")
  common_sequence_array = []

  common_elements = first_sequence_array & second_sequence_array #check if the arrays have common elements
  if common_elements.empty? #if the array is empty, no common elements
    return ""
  else #there are common elements
    while second_sequence_array.length > 0 || first_sequence_array.length > 0

      if first_sequence_array[first_sequence_array.length-1] == second_sequence_array[second_sequence_array.length-1]
        common_sequence_array.push(first_sequence_array[first_sequence_array.length-1])
        first_sequence_array.slice!(-1)
        second_sequence_array.slice!(-1)

      elsif first_sequence_array.count(second_sequence_array[-1]) == 0 && second_sequence_array.count(first_sequence_array[-1]) == 0
        first_sequence_array.slice!(-1)
        second_sequence_array.slice!(-1)

      elsif second_sequence_array.count(first_sequence_array[-1]) == 0
        first_sequence_array.slice!(-1)

      elsif first_sequence_array.count(second_sequence_array[-1]) == 0
        second_sequence_array.slice!(-1)

      elsif first_sequence_array[-1] < second_sequence_array[-1]
        first_sequence_array.slice!(-1)
      else
        second_sequence_array.slice!(-1)

      end
    end
    return common_sequence_array.reverse.join()
  end
end