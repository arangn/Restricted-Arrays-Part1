require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

# def length(array)
#   i = 0
#   @array.each do |i|
#     key = @restricted_array.[](i)
#     i += 1
#     if key == nil
#       blah = i - 1
#     end
#   end
#   return blah
# end

# def length(array)
#   i = 0
#   array.each do |i|
#     if array[i] == nil
#       length = i - 1
#     else i += 1
#     end
#   end
#   return length
# end


def length(array)
  i = 0
  loop do
    value = array[i]
    if value != nil
      i += 1
    elsif value == nil
      length = i
      return length
    end
  end
end

# Prints each integer values in the array
def print_array(array)
  print array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  length.times do
    if array[i] == value_to_find
      return true
    elsif i += 1
    end
  end
  return false
end
# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  i = 0
  largest_num = 0
  length.times do
    if array[i] > largest_num
      array[i] = largest_num
      i += 1
    else
      i += 1
    end
  end
  return largest_num
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  i = 0
  smallest_num = array[i]
  length.times do
    if array[i] < smallest_num
      array[i] = smallest_num
      i += 1
    else
      i += 1
    end
  end
  return smallest_num
end

# Reverses the values in the integer array in place
def reverse(array, length)
  i = 0
  e = length - 1
  temp = ""
  temp2 = ""
  while i < e do
    temp = array[i]
    temp2 = array[e]
    array[e] = temp
    array[i] = temp2
    i += 1
    e -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  low = array[0]
  high = array[length -  1]

  while low < high
    mid = (low + high / 2)
    if mid == value_to_find || high == value_to_find || low == value_to_find
      return true
    elsif mid > value_to_find
      high = mid - 1
    elsif mid < value_to_find
      low = mid + 1
    end
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
