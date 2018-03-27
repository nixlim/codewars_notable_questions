# Sum of Pairs
# https://www.codewars.com/kata/sum-of-pairs/train/ruby
# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.
# PASSES SAMPLE TESTS. NOT OPTIMIZED - NEEDS TO WORK FASTER.



def sum_pairs(ints, s)
  array = ints
  @s = s
  sum_pair = calculate_sum_pair(array)
  if sum_pair == nil
    inner_array = nil
  else
    inner_array = inner_array_checker(array, sum_pair)
  end

  if inner_array == nil
    puts sum_pair.to_s
  else
    if calculate_sum_pair(inner_array) == nil
      puts sum_pair.to_s
    else
      puts calculate_sum_pair(inner_array).to_s
    end
  end
end

def inner_array_checker(array, sum_pair)
  inner_array = array.slice(1,array.drop(1).index(sum_pair[1]))
  if inner_array.empty?
    nil
  else
    inner_array
  end
end

def calculate_sum_pair(array)
  first_element = array[0]
  remaining_array = array.drop(1)
  remaining_array.delete_if do |element|
    first_element + element != @s
  end
  if remaining_array.empty?
    array.delete_at(0)
    if array.length > 1
      calculate_sum_pair(array)
    else
      nil
    end
  else
    return [first_element, remaining_array[0]]
  end
end



l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, -6, 1]
l3= [20, -13, 40]
# l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 1, 1, 1, 7, 5]
# l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
# l8= [5, 9, 13, -3]
#
sum_pairs(l1, 8)
sum_pairs(l2, -6)
sum_pairs(l3, -7)
sum_pairs(l5, 10)
sum_pairs(l7, 0)