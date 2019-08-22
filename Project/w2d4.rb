require "byebug"

def my_min_p1(arr) # O(n^2)
  my_min = 0
  arr.each_with_index do | num1, idx1 |
    arr.each_with_index do | num2, idx2 |
      if num1 < num2 && idx1 > idx2 && num1 < my_min
        my_min = num1
      elsif num1 > num2 && idx1 > idx2 && num2 < my_min
        my_min = num2
      else
        next
      end
    end
  end
  return my_min
end

def my_min_p2(arr) # O(n)
  # my_min = 0
  arr.inject do |acc, el|
    if acc < el
      acc
    else
      el
    end
  end
end

def largest_contiguous_subsum_p1(arr) # O(n^k)
  acc = 0
  temp = {}
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
        temp[arr[idx1..idx2]] = arr[idx1..idx2].sum
    end
  end
  # p temp
  temp.max_by {|k, v| v}[-1]
end

def largest_contiguous_subsum_p2(arr) #O(n)
  max = 0
  cur = arr.first
  (1...arr.length).each do |i|
    cur += arr[i]
    if max < cur
      max = cur
    elsif cur < 0
      cur = 0
    end
  end
  max
end

# def largest_contiguous_subsum_p3(arr)
#   max = 0
#   cur = arr[0]
#   p1 = 0
#   while p1 < arr.length
#     p2 = p1
#     while p2 < arr.length && arr[p2] + sum >= sum
#       cur += arr[p2]
#       p2 += 1
#     end
#     max = cur if cur > max
#     p1 = p2 + 1
#   end
#   max
# end
def first_anagram?(str1, str2) #O(n!)
   arr1 = str1.split("")
   arr2 = str2.split("")
   arr1.permutation.to_a.include?(arr2)
end

# p first_anagram?("abc", "cba")

def second_anagram?(str1, str2) #O(n)
  arr1 = str1.split("")
  arr2 = str2.split("")
  arr1.each_with_index do | char, idx |
    if arr2.find_index(char)
       arr2.delete_at(arr2.index(char)) 
    end

  end
  return arr2.empty?
end

def third_anagram?(str1, str2) #O(n log n)
  arr1 = str1.split("")
  arr2 = str2.split("")
  arr1.sort == arr2.sort
end

def fourth_anagram?(str1, str2) #O(n)
  count(str1) == count(str2)
end

def count(str)
  h = Hash.new(0)
  str.each_char {|ch| h[ch] += 1}
  h
end

# p third_anagram?("elvis", "lives")

def bad_two_sum?(arr, target) # O(n^2)
 # new_arr = []
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2 |
      if idx1 < idx2 && (num1 + num2) == target
        return true
      end
    end
  end
  return false
end

def okay_two_sum?(arr, target) # O(n log n)
  new_arr = arr.sort
  i = 0 
  j = new_arr.length - 1
  while i < new_arr.length && j > i
   if new_arr[i] + new_arr[j] > target
      j -= 1
   elsif new_arr[i] + new_arr[j] < target 
      i +=1 
   else
    return true
   end
  end
  return false
end

def hash_two_sum?(arr, target)
  h = {}
  arr.each do |num1|
    #  debugger
    if h[num1].nil?
      h[num1] = target - num1
    else h.has_value?(num1)
      return true
    end
  end
  false
end

arr = [0, 1, 7, 5]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false