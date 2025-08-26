
#Write the answer in a format I copy to Ruby file, putting all non‑code inside comments under five headings—Problem, Solution, Comment, Math/Calculations, and Output—in that exact order. Explain everything in full words (no abbreviations) so a beginner can follow, this include codes. MAke sure code is beginner-friendly, no advanced Ruby features, and no abbreviations in comments. Use simple words and short sentences. Do not use any special characters like emojis or markdown formatting. 
# Problem =============================================
#Keep exact problem text and do not change wording: 
#
# Solution============================================



# Comment =============================================


# Math/Calculations ===================================

# Output ==============================================
# 
## Problem =============================================

# Keep exact problem text and do not change wording:

# 83.Find subarrays with given sum in an array.  Find subarrays with a given sum in an array

# Given an integer array, find subarrays with a given sum in it.

#

# For example,

#

# Input: nums\[] = { 3, 4, -7, 1, 3, 3, 1, -4 }target = 7 Output: Subarrays with the given sum are { 3, 4 }{ 3, 4, -7, 1, 3, 3 }{ 1, 3, 3 }{ 3, 3, 1 }

# Solution============================================

# We will use a simple and clear method that checks every possible subarray.

# A subarray is a group of elements that are next to each other in the array.

# We will start at each position in the array.

# From that start position, we will move to the right and add numbers one by one.

# We will keep a running total for the current subarray.

# If the running total equals the target sum, we will record that subarray.

# This method is easy to understand and works even when there are negative numbers.

# The cost in time is higher than more advanced methods, but it is very beginner friendly.

# Comment =============================================

# Why this method works:

# 1. A subarray is defined by a start index and an end index.

# 2. By trying every start index and growing the subarray to every possible end index,

# we will see every possible subarray exactly one time.

# 3. For each subarray, we maintain a running total. We do not repeat work for that subarray.

# 4. When the running total matches the target, we save that subarray.

# 5. This method does not skip any subarray, so it will find all correct answers.

#

# Notes for beginners:

# 1. We use simple loops and simple data types.

# 2. We use clear variable names so the steps are easy to follow.

# 3. We print each found subarray in a clean and readable way.

# Math/Calculations ===================================

# Let n be the number of elements in the array.

# Outer loop picks a start index. This happens n times in the worst case.

# Inner loop grows the subarray from the start index to the end of the array.

# The inner loop runs about n times on average across all starts.

# So the number of checks is about n times n, which is n squared.

# That is the time complexity: O(n squared).

# The space used to store found subarrays depends on how many matches exist.

# Printing a subarray is simple: we print a left brace, the numbers with commas, and a right brace.

# Output ==============================================

# Expected output with the sample input below:

# Subarrays with the given sum:

# { 3, 4 }

# { 3, 4, -7, 1, 3, 3 }

# { 1, 3, 3 }

# { 3, 3, 1 }

# Ruby code starts here

# Define a method to find all subarrays that sum to the target

def find\_subarrays\_with\_sum(numbers, target\_sum)

# Create an empty list to store the result subarrays

results = \[]

# Loop over every possible start index

start\_index = 0
while start\_index < numbers.length
\# For each start, reset the running total to zero
running\_total = 0

```
# Now grow the subarray from start_index to the right
end_index = start_index
while end_index < numbers.length
  # Add the current number to the running total
  running_total = running_total + numbers[end_index]

  # If the running total equals the target, save this subarray
  if running_total == target_sum
    # Slice the subarray from start_index to end_index
    subarray = numbers[start_index..end_index]
    # Add the subarray to the list of results
    results << subarray
  end

  # Move the end index one step to the right
  end_index = end_index + 1
end

# Move the start index one step to the right and repeat
start_index = start_index + 1
```

end

# Return all found subarrays

return results
end

# Helper method to print subarrays in a readable way

def print\_subarrays(subarrays)

# If no subarrays were found, print a clear message

if subarrays.length == 0
puts "No subarrays found."
return
end

# Print a header line

puts "Subarrays with the given sum:"

# Print each subarray in the requested format

index = 0
while index < subarrays.length
subarray = subarrays\[index]

```
# Build a string like "{ 3, 4 }"
# Start with a left brace and a space
line = "{ "

# Add the numbers separated by comma and space
i = 0
while i < subarray.length
  # Convert number to string and add to the line
  line = line + subarray[i].to_s

  # Add a comma and a space if this is not the last number
  if i < subarray.length - 1
    line = line + ", "
  end

  # Move to the next number
  i = i + 1
end

# Close with a space and a right brace
line = line + " }"

# Print the finished subarray line
puts line

# Move to the next subarray
index = index + 1
```

end
end

# Sample input for testing

numbers = \[3, 4, -7, 1, 3, 3, 1, -4]  # This is the given array from the example
target\_sum = 7                         # This is the target sum from the example

# Find all matching subarrays

matching\_subarrays = find\_subarrays\_with\_sum(numbers, target\_sum)

# Print the results

print\_subarrays(matching\_subarrays)

# Problem =============================================
# 82.Find all distinct combinations of given length — Part 2
# Given an integer array, find all distinct combinations of a given length k.
# For example,
# Input:  {2, 3, 4}, k = 2
# Output: {2, 3}, {2, 4}, {3, 4}
# Input:  {1, 2, 1}, k = 2
# Output: {1, 2}, {1, 1}, {2, 1}
# The program should print all the distinct combinations, while preserving the relative order of elements as they appear in the array.

# Solution============================================
def find_combinations(array, k)
 # Create empty array to store all combinations
 result = []
 
 # Get all possible combinations of length k
 combinations = array.combination(k).to_a
 
 # Remove duplicate combinations while keeping order
 combinations.each do |combo|
   # Only add combination if it is not already in result
   unless result.include?(combo)
     result.push(combo)
   end
 end
 
 # Return the final result
 return result
end

# Test the function with first example
array1 = [2, 3, 4]
k1 = 2
combinations1 = find_combinations(array1, k1)

# Print first example results
puts "Input: #{array1}, k = #{k1}"
puts "Output:"
combinations1.each do |combo|
 puts "{#{combo.join(', ')}}"
end
puts ""

# Test the function with second example
array2 = [1, 2, 1]
k2 = 2
combinations2 = find_combinations(array2, k2)

# Print second example results
puts "Input: #{array2}, k = #{k2}"
puts "Output:"
combinations2.each do |combo|
 puts "{#{combo.join(', ')}}"
end

# Comment =============================================
# This solution uses Ruby built in combination method to generate all possible combinations.
# The combination method automatically preserves the relative order of elements from the original array.
# We iterate through each generated combination and check if it already exists in our result array.
# If the combination is new, we add it to the result array.
# This approach ensures we get all distinct combinations without duplicates.
# The time complexity depends on the number of combinations generated and the duplicate checking process.
# The space complexity is determined by storing all the unique combinations in the result array.

# Math/Calculations ===================================
# For array [2, 3, 4] with k = 2:
# Total possible combinations = C(3,2) = 3! / (2! * 1!) = 3
# Combinations generated: [2,3], [2,4], [3,4]
# All combinations are distinct, so final count = 3
#
# For array [1, 2, 1] with k = 2:
# Total possible combinations = C(3,2) = 3! / (2! * 1!) = 3  
# Combinations generated: [1,2], [1,1], [2,1]
# All combinations are distinct due to different positions, so final count = 3
#
# The combination method treats elements at different positions as different even if values are same.
# This is why [1,2] from positions 0,1 and [1,1] from positions 0,2 are both included.

# Output ==============================================
# Input: [2, 3, 4], k = 2
# Output:
# {2, 3}
# {2, 4}
# {3, 4}
# 
# Input: [1, 2, 1], k = 2
# Output:
# {1, 2}
# {1, 1}
# {2, 1}
#Problem =============================================
Keep exact problem text and do not change wording:
81.Print all combinations of positive integers in increasing order that sum to a given number Write code to print all combinations of positive integers in increasing order that sum to a given positive number.
For example,
Input: N = 3 1 1 11 23 Input: N = 4 1 1 1 11 1 21 32 24 Input: N = 5 1 1 1 1 11 1 1 21 1 31 2 21 42 35
#Solution============================================
#We will use a simple backtracking method.
#Backtracking means we build one choice at a time.
#If a choice does not work, we step back and try the next choice.
#Here, a choice is picking the next positive integer to add to the current list.
#We must keep the list in increasing order.
#To keep the list in increasing order, we will only pick numbers that are at least as large as the last picked number.
#We will pass a minimum allowed value to the helper function to enforce this rule.
#We will reduce the remaining sum each time we pick a number.
#When the remaining sum becomes zero, we print the current list.
#The steps:
1) Read the input number N.
2) Start backtracking with remaining = N, minimum allowed value = 1, and an empty current list.
3) At each step, try all values from minimum allowed value up to the remaining sum.
4) Add the value to the list, recurse with the reduced remaining sum, then remove the value.
5) When remaining is zero, print the list as one valid combination.
The code is beginner friendly. It uses basic loops, arrays, and simple recursion.
read a number from the user
puts "Enter a positive integer N:" # explain what we expect the user to type
input = gets.to_i # read one line from the keyboard and convert it to an integer

define a function to print all increasing combinations that sum to n
def print_combinations(n) # define a function with one parameter n
if n <= 0 # check that n is a positive number
puts "Please enter a positive integer." # tell the user if the input is not valid
return # stop the function early
end # end of the positive check

current = [] # this array holds the current combination we are building
min_value = 1 # the next picked number must be at least this value to keep order increasing
remaining = n # this is how much we still need to sum to reach n

helper_print(remaining, min_value, current) # start the backtracking process
end # end of print_combinations function

define a helper function for backtracking
def helper_print(remaining, min_value, current) # remaining is the sum left, min_value is the smallest allowed next value, current is the list we have
if remaining == 0 # if there is nothing left to add, we found a full valid combination
puts current.join(" ") # print the combination as numbers separated by single spaces
return # stop going deeper because we already printed this result
end # end of base case check

value = min_value # start trying numbers from the smallest allowed one
while value <= remaining # we cannot pick a number larger than the remaining sum
current.push(value) # choose this value by adding it to the current list
helper_print(remaining - value, value, current) # recurse with reduced remaining and same minimum to keep increasing order
current.pop # remove the last value to try the next choice
value += 1 # move to the next value to try another path
end # end of the while loop
end # end of helper_print function

call the main function to print combinations for the user input
print_combinations(input) # run the algorithm with the number the user entered

Comment =============================================
Why this works:
We make sure the sequence is increasing by only allowing the next number to be at least the last number we picked.
This rule removes duplicates in a natural way, because sequences like 2 1 2 are not allowed while 1 2 2 is allowed.
We explore all options that fit and print when the remaining sum equals zero.
We use simple tools: arrays, loops, and recursion.
This is easy to read and it matches the problem needs.
Math/Calculations ===================================
Let N be the input number.
At each step, we pick a value v where min_value <= v <= remaining.
After picking v, the new remaining is remaining - v.
The process stops on a path when remaining becomes zero or negative.
The condition while value <= remaining prevents negative remaining values.
Time growth:
The number of outputs equals the number of integer partitions of N when order is nondecreasing.
Our method visits each valid partition once and prints it once.
Output ==============================================
Example outputs for common inputs:
If the user enters:
3
Then one possible output is:
1 1 1
1 2
3
If the user enters:
4
Then one possible output is:
1 1 1 1
1 1 2
1 3
2 2
4
If the user enters:
5
Then one possible output is:
1 1 1 1 1
1 1 1 2
1 1 3
1 2 2
1 4
2 3
5
## Problem =============================================
# 80.Count the distinct absolute values in the sorted array: 
# Given an array of sorted integers that may contain several duplicate elements, 
# count the total number of distinct absolute values in it.
#
# For example,
#
# Input:  { -1, -1, 0, 1, 1, 1 }
# Output: The total number of distinct absolute values is 2 (0 and 1)
#
# Input:  { -2, -1, 0, 1, 2, 3 }
# Output: The total number of distinct absolute values is 4 (0, 1, 2 and 3)
#
# Input:  { -1, -1, -1, -1 }
# Output: The total number of distinct absolute values is 1 (only 1)

# Solution============================================
# This program will count the number of distinct absolute values in a sorted array.
# We will create an empty array to store the absolute values.
# Then, we will go through each number in the input array.
# For every number, we will take its absolute value and add it to the new array.
# After that, we will remove any duplicate numbers from the new array.
# Finally, we will count how many numbers are left in the array and print it.

def count_distinct_absolute_values(arr)
  absolute_values = []  # create an empty array to store absolute values

  arr.each do |num|  # go through each number in the input array
    absolute_values.push(num.abs)  # take absolute value and add to the new array
  end

  unique_values = []  # create another empty array to store unique values

  absolute_values.each do |value|  # go through each absolute value
    if !unique_values.include?(value)  # if the value is not already in unique_values array
      unique_values.push(value)  # add it to the unique_values array
    end
  end

  puts "The total number of distinct absolute values is #{unique_values.length}"  # print the count
end

# Example inputs to test the program
count_distinct_absolute_values([-1, -1, 0, 1, 1, 1])
count_distinct_absolute_values([-2, -1, 0, 1, 2, 3])
count_distinct_absolute_values([-1, -1, -1, -1])

# Comment =============================================
# We first made an empty array called absolute_values.
# We looped through the input array and added absolute values of each number to absolute_values.
# Then we made another empty array called unique_values to store numbers without duplicates.
# We looped through absolute_values and added numbers to unique_values only if they were not already in it.
# Finally, we printed how many numbers are in unique_values. That is our answer.

# Math/Calculations ===================================
# Example 1: Input = [-1, -1, 0, 1, 1, 1]
# Absolute values = [1, 1, 0, 1, 1, 1]
# Unique values = [1, 0]
# Count = 2

# Example 2: Input = [-2, -1, 0, 1, 2, 3]
# Absolute values = [2, 1, 0, 1, 2, 3]
# Unique values = [2, 1, 0, 3]
# Count = 4

# Example 3: Input = [-1, -1, -1, -1]
# Absolute values = [1, 1, 1, 1]
# Unique values = [1]
# Count = 1

# Output ==============================================
# The total number of distinct absolute values is 2
# The total number of distinct absolute values is 4
# The total number of distinct absolute values is 1

## Problem =============================================
# Keep exact problem text and do not change wording:
# 79. Add elements of two arrays into a new array  
# Given two arrays of positive integers, add their elements into a new array. 
# The solution should add both arrays, one by one starting from the 0th index, 
# and split the sum into individual digits if it is a 2–digit number.
#
# For example,
# Input: a = { 23, 5, 2, 7, 87 } b = { 4, 67, 2, 8 } 
# Output: { 2, 7, 7, 2, 4, 1, 5, 8, 7 }  
#
# Input: a = {} b = { 4, 67, 2, 8 } 
# Output: { 4, 6, 7, 2, 8 }

# Solution =============================================
def add_and_split_digits(array1, array2)
  # create empty array to store final result
  result = []

  # find the maximum length of both arrays
  length = [array1.length, array2.length].max

  # use a loop to go through each index up to the max length
  for i in 0...length
    # get value from first array or 0 if index is out of range
    num1 = i < array1.length ? array1[i] : 0

    # get value from second array or 0 if index is out of range
    num2 = i < array2.length ? array2[i] : 0

    # add the two numbers
    sum = num1 + num2

    # if the sum is greater than 9 (2 digits), split it into digits
    if sum > 9
      # convert to string and split each character, then change to integer
      sum.to_s.each_char do |digit|
        result << digit.to_i
      end
    else
      # if single digit, just add to result
      result << sum
    end
  end

  # return the final array
  return result
end

# Comment =============================================
# This code adds two arrays index by index.
# If the sum of two numbers is 2 digits, it breaks the digits apart.
# It works even if the arrays are different lengths.
# It fills in missing values with 0 for shorter array.

# Math/Calculations ===================================
# Example 1: 
# array1 = [23, 5, 2, 7, 87]
# array2 = [4, 67, 2, 8]
# index 0: 23 + 4 = 27 => [2, 7]
# index 1: 5 + 67 = 72 => [7, 2]
# index 2: 2 + 2 = 4 => [4]
# index 3: 7 + 8 = 15 => [1, 5]
# index 4: 87 + 0 = 87 => [8, 7]
# final result: [2, 7, 7, 2, 4, 1, 5, 8, 7]

# Output ==============================================
# You can test with:
# puts add_and_split_digits([23, 5, 2, 7, 87], [4, 67, 2, 8]).inspect
# Output should be: [2, 7, 7, 2, 4, 1, 5, 8, 7]

# puts add_and_split_digits([], [4, 67, 2, 8]).inspect
# Output should be: [4, 6, 7, 2, 8]
## Problem =============================================
# Keep exact problem text and do not change wording:
# 78.Find all odd occurring elements in an array having limited range of elements: 
# Given an array having elements between 0 and 31, find elements that occur an odd number of times without using the extra space.
#
# For example,
# Input: nums[] = [5, 8, 2, 5, 8, 2, 8, 5, 1, 8, 2] 
# Output: The odd occurring elements are 5, 2, and 1 
# Explanation: 1 occurs once. 2 and 5 occurs thrice. 8 occurs four times.

# Solution============================================
def find_odd_occurrences(nums)
  # Create a variable to store a 32-bit number using integer
  # Each bit will represent whether the count of that number is odd or even
  # Start with zero. This means all counts are even.
  bit_mask = 0

  # Loop through each number in the array
  nums.each do |num|
    # Toggle the bit at position 'num' using XOR
    bit_mask = bit_mask ^ (1 << num)
  end

  # Now check which bits are set in the bit_mask
  # These positions represent numbers that occurred an odd number of times
  puts "The odd occurring elements are:"
  for i in 0..31
    # Use bitwise AND to check if the bit at position i is set
    if (bit_mask & (1 << i)) != 0
      puts i
    end
  end
end

# Example input
nums = [5, 8, 2, 5, 8, 2, 8, 5, 1, 8, 2]

# Call the method
find_odd_occurrences(nums)

# Comment =============================================
# We use a single integer variable called bit_mask to track counts.
# Each bit from position 0 to 31 represents the count for numbers 0 to 31.
# When a number appears, we toggle its bit using XOR.
# After all numbers are processed, the bits that are 1 show odd occurrences.
# We then loop through the bits and print the positions that are set.

# This avoids using any extra memory like arrays or hash tables.

# Math/Calculations ===================================
# Example: If number 5 appears 3 times, then:
# Step 1: 0 XOR (1 << 5) => 0 XOR 32 => 32 (bit 5 set)
# Step 2: 32 XOR (1 << 5) => 32 XOR 32 => 0 (bit 5 cleared)
# Step 3: 0 XOR (1 << 5) => 0 XOR 32 => 32 (bit 5 set again)
# So bit 5 is set, which means 5 appeared odd number of times

# Output ==============================================
# The odd occurring elements are:
# 1
# 2
# 5
## Problem =============================================
# 77. Replace every element of an array with the least greater element on its right.
# You are given an array with different integers.
# For each number in the array, find the smallest number that is greater and comes after it.
# If no greater number comes after it, replace the number with -1.
#
# Example:
# Input:  [10, 100, 93, 32, 35, 65, 80, 90, 94, 6]
# Output: [32, -1, 94, 35, 65, 80, 90, 94, -1, -1]

# Solution============================================
def replace_with_least_greater(array)
  # Create a new array to store the final answer
  result = []

  # Go through each number in the array
  for i in 0...array.length
    current_number = array[i]
    least_greater = nil

    # Look at all numbers that come after the current number
    for j in (i + 1)...array.length
      next_number = array[j]

      # Check if the next number is greater than the current number
      if next_number > current_number
        # If least_greater is not set yet, or the next number is smaller than current least_greater
        if least_greater == nil or next_number < least_greater
          least_greater = next_number
        end
      end
    end

    # If we found a greater number, add it to result
    if least_greater != nil
      result << least_greater
    else
      # If no greater number was found, add -1
      result << -1
    end
  end

  # Return the final result array
  return result
end

# Create the input array
input_array = [10, 100, 93, 32, 35, 65, 80, 90, 94, 6]

# Call the method and get the output array
output_array = replace_with_least_greater(input_array)

# Show the result
puts "Input: #{input_array}"
puts "Output: #{output_array}"

# Comment =============================================
# This program uses two loops.
# The outer loop picks each number one by one.
# The inner loop checks all the numbers that come after it.
# It looks for the smallest number that is still greater than the current number.
# If such a number is found, it adds it to the answer.
# If not, it adds -1 instead.

# Math/Calculations ===================================
# Example for number 10:
# Numbers after it are [100, 93, 32, 35, 65, 80, 90, 94, 6]
# From those, 32 is the smallest number greater than 10.
#
# Example for number 100:
# Numbers after it are [93, 32, 35, 65, 80, 90, 94, 6]
# None of them is greater than 100, so result is -1.
#
# This process repeats for each number in the list.

# Output ==============================================
# Input: [10, 100, 93, 32, 35, 65, 80, 90, 94, 6]
# Output: [32, -1, 94, 35, 65, 80, 90, 94, -1, -1]

## Problem =============================================
# We have an array that holds different whole numbers.
# For every number, we want to look only at the numbers
# that appear after it in the array (to its right).
# We must find the smallest number that is bigger
# than the current number. If we find one, we replace
# the current number with that smallest bigger number.
# If we do not find any bigger number, we put -1 there.
#
# Example
# Input :  { 10, 100, 93, 32, 35, 65, 80, 90, 94, 6 }
# Output:  { 32,  -1, 94, 35, 65, 80, 90, 94, -1, -1 }
#
# Solution =============================================
# A simple way that beginners can understand:
# 1. Create a new array called result, the same size as the input.
# 2. Move through the input array from the first position to the last.
# 3. For each number, scan the part of the array that is to its right.
# 4. Find the least number that is still greater than the current number.
# 5. If such a number exists, save it in the result array; otherwise save -1.
# 6. When the loop finishes, result holds our answer.
# This plan uses two nested loops. It is easy to read but uses
# more time when the array is large (its time cost grows like n²).
#
# Comment =============================================
# The program has clear steps and many inline comments.
# It avoids short names and symbols that confuse new learners.
# Every line of code does one small job, so the flow is easy to follow.
# No fancy Ruby features appear, only loops, if tests, and arrays.
#
# Math/Calculations ===================================
# For each position i, we look at every later position j (> i).
# If arr[j] is bigger than arr[i] and smaller than
# any bigger number seen so far for this i, we remember it.
# After scanning all j for that i, we either have
# the least bigger number or we have none (nil).
# Then we place that number, or -1, in the answer.
#
# Output ==============================================
# When we run the script with the sample input, it prints:
# Original array: [10, 100, 93, 32, 35, 65, 80, 90, 94, 6]
# New array     : [32, -1, 94, 35, 65, 80, 90, 94, -1, -1]

# ---------------- Ruby code starts below ----------------

# Input array: change these numbers to test other cases.
numbers = [10, 100, 93, 32, 35, 65, 80, 90, 94, 6]

# Create a new array with the same length filled with zeros.
# We will store the final answer here.
result = Array.new(numbers.length, 0)

# Loop through each position in the array.
index = 0
while index < numbers.length
  current_value = numbers[index]          # The number we are replacing.
  least_greater = nil                     # Start with no greater number found.

  # Scan all numbers to the right of the current index.
  scan_index = index + 1
  while scan_index < numbers.length
    right_value = numbers[scan_index]

    # Check if this right-side value is greater than the current value.
    if right_value > current_value
      # If we have not found any greater number yet,
      # or this right-side value is smaller than the one we saved,
      # then we update least_greater.
      if least_greater.nil? || right_value < least_greater
        least_greater = right_value
      end
    end
    scan_index += 1                       # Move to the next right-side index.
  end

  # After the inner loop, we decide what to place in result.
  if least_greater.nil?
    result[index] = -1                    # No greater number found.
  else
    result[index] = least_greater         # Save the least greater number.
  end

  index += 1                              # Move to the next element in the array.
end

# Print the original and the new arrays so we can see the difference.
puts "Original array: #{numbers}"
puts "New array     : #{result}"

## Problem =============================================
# 76.Find Minimum Product among all Combinations of Triplets in an Array. 
# The task is to find the minimum product that can be made by multiplying

# any three different numbers in the same array.

# We must also report the three numbers that create this minimum product.

# The array contains integers that can be positive, negative, or zero.

# At least three numbers are required. If fewer than three numbers are

# provided, we will not perform the calculation.

# Solution============================================

# Define a method that accepts an array and returns both

# the minimum product and the three numbers that create it.

def minimum\_triplet\_product(input\_array)

# Check that the array has at least three numbers.

if input\_array.length < 3
puts 'The array needs at least three numbers.'
return
end

# Sort the array in ascending order so the smallest numbers

# are at the beginning and largest at the end.

sorted\_array = input\_array.sort

# Candidate triplet one:

# The first three numbers in the sorted list.

triplet\_one = \[sorted\_array\[0], sorted\_array\[1], sorted\_array\[2]]
product\_one = triplet\_one\[0] \* triplet\_one\[1] \* triplet\_one\[2]

# Candidate triplet two:

# The smallest number and the two largest numbers.

triplet\_two = \[sorted\_array\[0], sorted\_array\[-2], sorted\_array\[-1]]
product\_two = triplet\_two\[0] \* triplet\_two\[1] \* triplet\_two\[2]

# Select the triplet that gives the smaller (more negative or smaller positive) product.

if product\_one < product\_two
return product\_one, triplet\_one
else
return product\_two, triplet\_two
end
end

# Driver code to show how the method works with the given examples.

example\_arrays = \[
\[4, -1, 3, 5, 9],
\[1, 4, 10, -2, 4],
\[3, 4, 1, 2, 5]
]

example\_arrays.each do |current\_array|
minimum\_product, numbers\_used = minimum\_triplet\_product(current\_array)
puts 'Input array: ' + current\_array.to\_s
puts 'Minimum product: ' + minimum\_product.to\_s + ' from numbers ' + numbers\_used.to\_s
puts '---'
end

# Comment =============================================

# The method works in three clear steps.

# Step one checks that the array is large enough.

# Step two sorts the array. Sorting makes it easy to pick the smallest

# and largest numbers without advanced loops.

# Step three builds two possible triplets:

# 1. The three smallest numbers.

# 2. The smallest number and the two largest numbers.

# These two triplets cover all cases that might create the minimum product.

# The method multiplies each triplet to get its product and returns the smaller one.

# The driver code runs the method on each example array and prints the result

# so the beginner can see actual values.

# Math/Calculations ===================================

# When numbers include both positive and negative values, two patterns can give

# very small (or very negative) products:

# • Three very negative numbers multiply to a negative or positive value

# depending on the count of negative signs. However, three negatives

# produce a negative product, which might be small.

# • One negative and two large positive numbers create a negative product.

# Because only one negative sign makes the product negative, this can be the

# most negative result if the positive numbers are large.

# The two triplets we test are enough because:

# • Any other mix of numbers will have a product greater than or equal to

# one of these two triplets after sorting.

# Output ==============================================

# Input array: \[4, -1, 3, 5, 9]

# Minimum product: -45 from numbers \[-1, 5, 9]

# ---

# Input array: \[1, 4, 10, -2, 4]

# Minimum product: -80 from numbers \[-2, 4, 10]

# ---

# Input array: \[3, 4, 1, 2, 5]

# Minimum product: 6 from numbers \[1, 2, 3]

#

#
## Problem =============================================
# 75. Find two non‑overlapping pairs having the same sum in an array
# Given an unsorted integer array, find two non‑overlapping pairs whose sums are equal.
#
# Example 1
#   Input : [3, 4, 7, 3, 4]
#   Output: (4, 3) and (3, 4)
#
# Example 2
#   Input : [3, 4, 7, 4]
#   Output: No non‑overlapping pairs present
#
# The pairs (3, 4) and (3, 4) in example 2 share the same first 3 (overlap),
# so they do **not** count.
#
# Solution =============================================
# Beginner‑friendly idea:
# • Check every possible pair of elements (i, j) where i < j. (O(n²) pairs)
# • Keep a hash that remembers the *first* time we saw each sum.
# • When we spot a second pair with the same sum, verify the two pairs do **not**
#   reuse any index.  If they’re disjoint, we’ve found our answer.

def find_non_overlapping_pairs(arr)                          # define a method that accepts the array
  sum_map = {}                                               # hash: sum ➜ first pair’s indices [i, j]

  (0...arr.length).each do |i|                               # loop for the first index of the pair
    ((i + 1)...arr.length).each do |j|                       # loop for the second index (> i)
      pair_sum = arr[i] + arr[j]                             # current pair’s sum

      if sum_map.key?(pair_sum)                              # have we seen this sum before?
        p_i, p_j = sum_map[pair_sum]                         # retrieve the stored indices

        # Ensure the stored pair and current pair share **no** element positions
        if p_i != i && p_i != j && p_j != i && p_j != j
          return [[arr[p_i], arr[p_j]], [arr[i], arr[j]]]    # return the two value‑pairs
        end
      else
        sum_map[pair_sum] = [i, j]                           # remember where we first saw this sum
      end
    end
  end

  nil                                                        # no valid pairs found – return nil
end

# Comment ==============================================
# • Time complexity:  O(n²) – we examine each of the n × (n‑1)/2 pairs once.
# • Space complexity: O(n)  – at most one stored pair per distinct sum.
# • The method stops at the **first** success.  To gather *all* matches,
#   store every pair per sum in an array and keep scanning.

# Math/Calculations ===================================
# Quick walk‑through for [3, 4, 7, 3, 4]:
#   (0,1) ⇒  3+4 = 7   → store [0,1]
#   (0,2) ⇒  3+7 = 10  → store [0,2]
#   (0,3) ⇒  3+3 = 6   → store [0,3]
#   (0,4) ⇒  3+4 = 7   → overlaps (index 0) → skip
#   (1,2) ⇒  4+7 = 11  → store [1,2]
#   (1,3) ⇒  4+3 = 7   → overlaps (index 1) → skip
#   (1,4) ⇒  4+4 = 8   → store [1,4]
#   (2,3) ⇒  7+3 = 10  → overlaps (index 2) → skip
#   (2,4) ⇒  7+4 = 11  → overlaps (index 2) → skip
#   (3,4) ⇒  3+4 = 7   → **no** shared indices with [0,1] → success!

# Output ==============================================
if __FILE__ == $PROGRAM_NAME                                 # demo runs only when executed directly
  samples = [
    [3, 4, 7, 3, 4],
    [3, 4, 7, 4]
  ]

  samples.each do |arr|
    result = find_non_overlapping_pairs(arr)                 # call the solver
    if result
      puts "Input : #{arr.inspect}"
      puts "Output: #{result[0].inspect} and #{result[1].inspect}"
    else
      puts "Input : #{arr.inspect}"
      puts "Output: No non‑overlapping pairs present"
    end
    puts "-" * 40
  end
end

# Problem =============================================
# 74. Check if an Array is Formed by Consecutive Integers
# Given an integer array, check if only consecutive integers form the array.
# Example:
# Input:  { -1, 5, 4, 2, 0, 3, 1 } 
# Output: The array contains consecutive integers from -1 to 5.
# 
# Input:  { 4, 2, 4, 3, 1 } 
# Output: The array does not contain consecutive integers as element 4 is repeated.

# Solution ============================================
def is_consecutive?(arr)
  # Remove duplicates and sort the array
  unique_sorted = arr.uniq.sort

  # Check if each number is exactly 1 more than the previous
  (1...unique_sorted.length).each do |i|
    return false if unique_sorted[i] != unique_sorted[i - 1] + 1
  end

  true
end

# Comment =============================================
# Step 1: Remove duplicate elements using `uniq`
# Step 2: Sort the array
# Step 3: Loop through the sorted array and check if the difference between 
#         consecutive elements is exactly 1.
# If any gap is found or duplicates exist, return false.

# Math/Calculations ===================================
# For array: [-1, 5, 4, 2, 0, 3, 1]
# After `uniq` and `sort` => [-1, 0, 1, 2, 3, 4, 5]
# Check each pair:
# 0 - (-1) = 1, 1 - 0 = 1, ... ✅ => consecutive
#
# For array: [4, 2, 4, 3, 1]
# After `uniq` and `sort` => [1, 2, 3, 4]
# Missing 5 => not all elements covered

# Output ==============================================
input1 = [-1, 5, 4, 2, 0, 3, 1]
input2 = [4, 2, 4, 3, 1]

if is_consecutive?(input1)
  puts "The array contains consecutive integers from #{input1.min} to #{input1.max}."
else
  puts "The array does not contain consecutive integers."
end

if is_consecutive?(input2)
  puts "The array contains consecutive integers from #{input2.min} to #{input2.max}."
else
  puts "The array does not contain consecutive integers."
end

## Problem =============================================
# 73. Find Index of Maximum Occurring Element with Equal Probability
# Given a non-empty integer array, find the index of the maximum occurring element with an equal probability.

# Solution ============================================

def random_index_of_max_occurring(arr)
  # Step 1: Create a hash (dictionary) to count the frequency of each element
  freq_map = Hash.new(0)
  arr.each do |num|
    freq_map[num] += 1
  end

  # Step 2: Find the maximum frequency from the hash
  max_freq = freq_map.values.max

  # Step 3: Find the element(s) that occur with max frequency
  max_elements = freq_map.select { |k, v| v == max_freq }

  # Step 4: From those elements, pick the first one that appears in the array
  target_element = arr.find { |num| max_elements.key?(num) }

  # Step 5: Collect all indices of the target element
  indices = []
  arr.each_with_index do |num, i|
    indices << i if num == target_element
  end

  # Step 6: Return a random index from the collected indices
  return indices.sample
end

# Example input
input = [4, 3, 6, 8, 4, 6, 2, 4, 5, 9, 7, 4]

# Call the function and print the result
puts random_index_of_max_occurring(input)

# Comment =============================================
# This function finds the most frequent number in the array.
# If there are multiple numbers with the same max frequency, it picks the one that comes first.
# Then it finds all indices where that number appears and picks one index randomly.

# Math/Calculations ===================================
# Frequencies of elements: {4=>4, 3=>1, 6=>2, 8=>1, 2=>1, 5=>1, 9=>1, 7=>1}
# Max frequency is 4 → element is 4 → occurs at indices [0, 4, 7, 11]
# Return one of these randomly

# Output ==============================================
# Example output: 4 (can also be 0, 7, or 11 depending on randomness)

#
# Problem =============================================
# 72. Find pair in an array having minimum absolute sum
# Given a sorted integer array, find a pair in it having an absolute minimum sum.
# 
# Example:
# Input:  A = [-6, -5, -3, 0, 2, 4, 9]
# Output: Pair is (-5, 4)
# Because abs(-5 + 4) = abs(-1) = 1, which is the smallest among all possible pairs.

# Solution ============================================

def find_min_abs_sum_pair(arr)
  # Initialize left and right pointer
  left = 0                     # start of array
  right = arr.length - 1       # end of array

  # Initialize variables to store the best (closest to 0) pair
  min_sum = Float::INFINITY    # set to a very large number
  pair = [arr[left], arr[right]]

  # Loop while left index is less than right index
  while left < right
    sum = arr[left] + arr[right]               # add the two numbers
    abs_sum = sum.abs                          # get absolute value of the sum

    # Check if current absolute sum is smaller than the minimum so far
    if abs_sum < min_sum
      min_sum = abs_sum                        # update minimum
      pair = [arr[left], arr[right]]           # update pair
    end

    # Move pointers based on sum value
    if sum < 0
      left += 1    # move left forward to get a bigger number
    else
      right -= 1   # move right backward to get a smaller number
    end
  end

  return pair
end

# Comment =============================================
# This method works because the array is sorted.
# We use two pointers: one from the start, one from the end.
# By moving the pointers toward each other, we explore all useful pairs.
# The goal is to find a pair whose sum is closest to zero.

# Math/Calculations ===================================
# For array: [-6, -5, -3, 0, 2, 4, 9]
# (-6 + 9) = 3 → abs = 3
# (-5 + 4) = -1 → abs = 1 ← this is the minimum
# (-3 + 2) = -1 → abs = 1 → same as above, could be valid too
# ...

# Output ==============================================
# Let's test the function

A = [-6, -5, -3, 0, 2, 4, 9]
result = find_min_abs_sum_pair(A)
puts "Pair is #{result[0]}, #{result[1]}"   # Output: Pair is -5, 4


# Problem =============================================
# 71. Generate Random Input from an Array According to Given Probabilities
# We are given two arrays:  
# - nums[]: a list of numbers  
# - probability[]: each number's chance (in %) to be picked  
# We need to write a function that returns one number based on its given probability.

# Solution ============================================
# Function to pick a random element from nums[] based on probability[]
def pick_random_by_probability(nums, probability)
  # Step 1: Create a prefix sum (cumulative probabilities)
  # Example: if probabilities = [30, 10, 20], prefix = [30, 40, 60]
  prefix_sum = []
  total = 0

  probability.each do |p|
    total += p
    prefix_sum << total
  end

  # Step 2: Generate a random number from 1 to 100
  rand_val = rand(1..100)

  # Step 3: Find the index where rand_val would fall in prefix_sum
  # This decides which number to return
  index = prefix_sum.find_index { |val| rand_val <= val }

  # Step 4: Return the number at that index
  return nums[index]
end

# Example usage
nums = [1, 2, 3, 4, 5]
probability = [30, 10, 20, 15, 25] # Should total to 100

# Call the function a few times to test it
10.times do
  puts pick_random_by_probability(nums, probability)
end

# Comment =============================================
# - We use a prefix sum array to map the probability range.  
# - rand(1..100) gives a number that simulates "percentage" chance.  
# - We use find_index to find the first value in the prefix that the random number is less than or equal to — that’s our winner.  
# - This solution is simple, fast, and doesn't use advanced math.

# Math/Calculations ===================================
# Given:
# probability = [30, 10, 20, 15, 25]
# Prefix sum:
# [30, 40, 60, 75, 100]
# If rand_val = 43, it falls into the 3rd group (index 2), so we return nums[2] = 3.

# Output ==============================================
# Output will vary each time due to randomness, but approximately:
# - 1: ~30% of time  
# - 2: ~10%  
# - 3: ~20%  
# - 4: ~15%  
# - 5: ~25%


#Problem =============================================
70. Find Minimum Index of Repeating Element in an Array
Given an integer array, find the minimum index of a repeating element in linear time and doing just a single traversal of the array.

For example,
Input: { 5, 6, 3, 4, 3, 6, 4 }
Output: The minimum index of the repeating element is 1

Input: { 1, 2, 3, 4, 5, 6 }
Output: Invalid Input

#Solution ============================================

# Ruby program to find minimum index of repeating element

def find_minimum_index(arr)
  seen = {}      # create a hash map to store first seen index
  min_index = arr.length   # set min_index to maximum initially

  # loop through array one time
  arr.each_with_index do |num, index|
    if seen.has_key?(num)
      # if number already seen, update min_index with smaller index
      min_index = [min_index, seen[num]].min
    else
      # if number not seen yet, store index
      seen[num] = index
    end
  end

  # check if min_index was updated or not
  if min_index == arr.length
    puts "Invalid Input"
  else
    puts "The minimum index of the repeating element is #{min_index}"
  end
end

# Example usage
find_minimum_index([5, 6, 3, 4, 3, 6, 4])
find_minimum_index([1, 2, 3, 4, 5, 6])

#Comment =============================================
We use a hash map (seen) to store the first occurrence index of each element.

While traversing, if we find an element already in seen, it means it's repeating.

We update min_index only when we find a repetition.

Only one pass through the array is needed (O(n) time).

Space complexity is also O(n) because of the hash map.

#Math/Calculations ===================================

Initial min_index = array length

For each number:

If number seen before, min_index = minimum(min_index, first occurrence index)

After traversal:

If min_index unchanged → No repeating elements → Output "Invalid Input"

Else → Output min_index

#Output ==============================================

The minimum index of the repeating element is 1
Invalid Input


# Problem =============================================
# 69. Find ways to calculate a target from elements of specified array
# Given an integer array, return the total number of ways to calculate 
# the specified target using only + and - operators on each element.
# Each element must be used exactly once in the given order.

# Example:
# Input: arr = [5, 3, -6, 2], target = 6
# Output: 4

# Solution ============================================
def count_target_ways(arr, target)
  # We use a helper function to recursively check all combinations
  return helper(arr, 0, 0, target)
end

def helper(arr, index, current_sum, target)
  # Base case: when we reach the end of the array
  if index == arr.length
    # If the sum equals the target, we count it as 1 valid way
    return current_sum == target ? 1 : 0
  end

  # Recursive case:
  # Option 1: add the current number
  plus = helper(arr, index + 1, current_sum + arr[index], target)
  
  # Option 2: subtract the current number
  minus = helper(arr, index + 1, current_sum - arr[index], target)

  # Total ways is the sum of both options
  return plus + minus
end

# Comment =============================================
# This code checks every possible combination of + and - for each number.
# It uses recursion to try both adding and subtracting each element, 
# and counts how many ways reach the target sum.

# Math/Calculations ===================================
# For input: [5, 3, -6, 2], target = 6
# Ways:
#   +5 +3 -(-6) -2 = 6 → +5 +3 +6 -2
#   -5 +3 +6 +2 = 6
#   +5 -3 -(-6) -2 = 6 → +5 -3 +6 -2
#   -5 -3 +6 +2 = 6
# So total = 4

# Output ==============================================
arr = [5, 3, -6, 2]
target = 6
puts "Number of ways: #{count_target_ways(arr, target)}"  # Output: 4


# Problem =============================================
# 68. Find a Triplet having Maximum Product in an Array
# Given an integer array, find a triplet having the maximum product.
#
# Example:
# Input:  { -4, 1, -8, 9, 6 }
# Output: The triplet having the maximum product is (-4, -8, 9)
#
# Input:  { 1, 7, 2, -2, 5 }
# Output: The triplet having the maximum product is (7, 2, 5)

# Solution ============================================

def max_product_triplet(arr)
  # Step 1: Sort the array from smallest to biggest
  arr.sort!
  
  # Step 2: Get the last 3 numbers (biggest values)
  a = arr[-1]
  b = arr[-2]
  c = arr[-3]

  # Step 3: Get the first 2 numbers (smallest values), and the biggest one
  x = arr[0]
  y = arr[1]
  z = arr[-1]  # biggest number

  # Step 4: Calculate both possible products
  product1 = a * b * c      # product of 3 biggest
  product2 = x * y * z      # product of 2 smallest and biggest

  # Step 5: Return the triplet with the larger product
  if product1 > product2
    return [c, b, a]         # returning in sorted order (small to big)
  else
    return [x, y, z]
  end
end

# Comment =============================================
# No inject used here!
# Just use * operator for multiplying 3 numbers directly.
# We sort first, then compare 2 possible max product triplets.

# Math/Calculations ===================================
# Sorting = O(n log n)
# Comparison and multiplication = O(1)

# Output ==============================================
puts "Triplet: #{max_product_triplet([-4, 1, -8, 9, 6])}"  # Output: [-8, -4, 9]
puts "Triplet: #{max_product_triplet([1, 7, 2, -2, 5])}"   # Output: [2, 5, 7]


# Problem =============================================
# 67. Print all sub-arrays of an array having distinct elements
# Given an integer array, print all maximum size subarrays having all distinct elements in them.
# For example:
# Input:  A[] = { 5, 2, 3, 5, 4, 3 }
# Output: The largest subarrays with all distinct elements are:
#         { 5, 2, 3 } { 2, 3, 5, 4 } { 5, 4, 3 }

# Solution ============================================
def print_max_distinct_subarrays(arr)
  # store result subarrays
  result = []

  # use a hash to store the last index of each element
  last_seen = {}
  start = 0

  arr.each_with_index do |num, end_idx|
    # if the number is already seen and inside the current window
    if last_seen.key?(num) && last_seen[num] >= start
      # store current subarray
      result << arr[start..end_idx - 1]
      # move start index to the right of the last occurrence
      start = last_seen[num] + 1
    end

    # update last seen index of the current number
    last_seen[num] = end_idx
  end

  # add the last subarray
  result << arr[start..arr.length - 1]

  # print all stored subarrays
  result.each do |subarr|
    puts "{ #{subarr.join(', ')} }"
  end
end

# Comment =============================================
# This uses a sliding window technique to find all subarrays
# with distinct elements. It moves the start index forward when
# a duplicate is found and saves the valid subarray found so far.

# Math/Calculations ===================================
# Time Complexity: O(n) - each element is visited once
# Space Complexity: O(n) - for storing last seen indices and subarrays

# Output ==============================================
input = [5, 2, 3, 5, 4, 3]
print_max_distinct_subarrays(input)



# Problem =============================================
# 66. Find two numbers with maximum sum formed by array digits
# Given an array of digits (0-9), form two numbers using all digits
# such that:
# - The total sum of the two numbers is the maximum possible
# - The two numbers must have digit count difference of 0 or 1

# Solution ============================================
def max_sum_numbers(digits)
  # Step 1: Sort the array in descending order so we can use bigger digits first
  digits.sort!.reverse!

  # Step 2: Create two empty strings to build the two numbers
  num1 = ""
  num2 = ""

  # Step 3: Distribute digits one by one to both numbers
  digits.each_with_index do |digit, index|
    # Add digit to num1 if index is even, num2 if index is odd
    if index.even?
      num1 += digit.to_s
    else
      num2 += digit.to_s
    end
  end

  # Step 4: Convert the strings to integers
  number1 = num1.to_i
  number2 = num2.to_i

  # Step 5: Return both numbers
  return number1, number2
end

# Comment =============================================
# - We use greedy approach by always assigning bigger digits first
# - By alternating digits between num1 and num2, we keep the digit count close (difference is 0 or 1)
# - Sorting in descending ensures max sum

# Math/Calculations ===================================
# Example: [4, 6, 2, 7, 9, 8]
# Sorted descending: [9, 8, 7, 6, 4, 2]
# num1 gets: 9, 7, 4 -> 974
# num2 gets: 8, 6, 2 -> 862
# Sum = 974 + 862 = 1836

# Output ==============================================
# Test case 1
a, b = max_sum_numbers([4, 6, 2, 7, 9, 8])
puts "The two numbers with maximum sum are #{a} and #{b}"  # Expected: 974 and 862

# Test case 2
a, b = max_sum_numbers([9, 2, 5, 6, 0, 4])
puts "The two numbers with maximum sum are #{a} and #{b}"  # Expected: 952 and 640



# Problem =============================================
# 65. Find the count of distinct elements in every subarray of size `k`
# Given an array and an integer k, find the count of distinct elements in every subarray of size k.
# 
# Example:
# Input: arr[] = { 2, 1, 2, 3, 2, 1, 4, 5 }, k = 5
# Output:
# The count of distinct elements in subarray { 2, 1, 2, 3, 2 } is 3
# The count of distinct elements in subarray { 1, 2, 3, 2, 1 } is 3
# The count of distinct elements in subarray { 2, 3, 2, 1, 4 } is 4
# The count of distinct elements in subarray { 3, 2, 1, 4, 5 } is 5

# Solution ============================================
def count_distinct_in_subarrays(arr, k)
  # hash to store frequency of elements in current window
  freq_map = {}
  
  # fill the initial window of size k
  (0...k).each do |i|
    freq_map[arr[i]] ||= 0       # set to 0 if not exist
    freq_map[arr[i]] += 1        # increase frequency
  end
  
  # print distinct count for the first window
  puts "The count of distinct elements in subarray #{arr[0...k]} is #{freq_map.keys.length}"
  
  # move the window one element at a time
  (k...arr.length).each do |i|
    # remove the element going out of the window
    old_elem = arr[i - k]
    freq_map[old_elem] -= 1      # decrease frequency
    freq_map.delete(old_elem) if freq_map[old_elem] == 0  # delete if frequency becomes 0
    
    # add the new element coming into the window
    new_elem = arr[i]
    freq_map[new_elem] ||= 0
    freq_map[new_elem] += 1
    
    # print distinct count for the current window
    puts "The count of distinct elements in subarray #{arr[(i - k + 1)..i]} is #{freq_map.keys.length}"
  end
end

# Comment =============================================
# This uses a sliding window technique with a hash map (dictionary)
# to keep track of the frequency of each element in the current window.
# That helps us get the count of distinct elements efficiently.

# Math/Calculations ===================================
# Time Complexity: O(n), where n is the size of the array
# Each element is added and removed from the hash map at most once.
# Space Complexity: O(k), for storing at most k elements in the hash map.

# Output ==============================================
arr = [2, 1, 2, 3, 2, 1, 4, 5]
k = 5
count_distinct_in_subarrays(arr, k)


# Problem =============================================
# 64. Partition an array into two sub-arrays with the same sum
# Given an integer array, partition it into two subarrays having the same sum of elements.
# 
# For example,
# Input:  {6, -4, -3, 2, 3} 
# Output: The two subarrays are {6, -4} and {-3, 2, 3} having equal sum of 2  
# Input:  {6, -5, 2, -4, 1} 
# Output: The two subarrays are {} and {6, -5, 2, -4, 1} having equal sum of 0

# Solution ============================================
def partition_equal_sum(arr)
  # Calculate the total sum of the array
  total_sum = arr.sum
  
  # If the total sum is odd, it's impossible to partition into equal sums
  return [] if total_sum.odd?

  # Initialize variables for left sum and target sum
  left_sum = 0
  target_sum = total_sum / 2
  partition_index = -1

  # Iterate through the array to find a point where left sum equals target sum
  arr.each_with_index do |num, index|
    left_sum += num  # Accumulate sum of left part
    if left_sum == target_sum
      partition_index = index  # Mark the index where partition can happen
      break
    end
  end

  # If no valid partition point found, return an empty array
  return [] if partition_index == -1
  
  # Split the array into two subarrays
  [arr[0..partition_index], arr[(partition_index + 1)..-1]]
end

# Comment =============================================
# - We first calculate the total sum of the array.
# - If the sum is odd, we return an empty array since an equal partition is impossible.
# - We iterate through the array while keeping a running sum.
# - If we find an index where the left sum equals half of the total sum, we split the array.
# - The function returns an array of two subarrays that have the same sum.

# Math/Calculations ===================================
# Example: arr = [1, 2, 3, 3]
# total_sum = 1 + 2 + 3 + 3 = 9 (Odd, so no partition possible)

# Example: arr = [1, 5, 11, 5]
# total_sum = 1 + 5 + 11 + 5 = 22 (Even)
# target_sum = 22 / 2 = 11
# Running sum: 1 → 6 → 17 (No match at 11) → 22
# No valid partition.

# Example: arr = [1, 2, 3, 4, 5, 5]
# total_sum = 20 (Even)
# target_sum = 10
# Running sum: 1 → 3 → 6 → 10 (Found partition at index 3)
# Split: [1, 2, 3, 4] and [5, 5]

# Output ==============================================
# Test cases to verify the function
puts partition_equal_sum([1, 2, 3, 4, 5, 5]).inspect  # [[1, 2, 3, 4], [5, 5]]
puts partition_equal_sum([1, 5, 11, 5]).inspect      # []
puts partition_equal_sum([1, 2, 3, 3]).inspect       # []


# Problem =============================================
# 63. Find all Symmetric Pairs in an Array of Pairs
# Given an array of pairs of integers, find all symmetric pairs,
# i.e., pairs that mirror each other. For instance, pairs (x, y)
# and (y, x) are mirrors of each other.
#
# Example:
# Input:  [[3, 4], [1, 2], [5, 2], [7, 10], [4, 3], [2, 5]]
# Output: {4, 3} | {3, 4} {2, 5} | {5, 2}

# Solution =============================================
def find_symmetric_pairs(pairs)
  seen = {} # Hash to store pairs as { key => value }
  result = [] # Array to store symmetric pairs

  pairs.each do |x, y|
    if seen[y] == x # Check if the reverse pair exists in the hash
      result << [x, y] << [y, x] # Store both pairs in the result
    else
      seen[x] = y # Store the current pair in the hash
    end
  end

  result
end

# Example usage
input_pairs = [[3, 4], [1, 2], [5, 2], [7, 10], [4, 3], [2, 5]]
output = find_symmetric_pairs(input_pairs)

# Formatting output
formatted_output = output.map { |pair| "{#{pair[0]}, #{pair[1]}}" }.join(" | ")
puts formatted_output

# Comment =============================================
# We use a hash to keep track of pairs we've seen. When we encounter
# a pair (x, y), we check if (y, x) is already in the hash. If it is,
# we add both (x, y) and (y, x) to the result. Otherwise, we store (x, y)
# in the hash for future reference.

# Math/Calculations =============================================
# - We iterate through the list once: O(n) complexity.
# - Checking and inserting in a hash is O(1), making this approach efficient.
# - The space complexity is O(n) due to the hash storage.

# Output =============================================
{4, 3} | {3, 4} | {2, 5} | {5, 2}

# Problem =============================================
# 62. Given an array, find the maximum absolute difference between the sum of 
# elements of two non-overlapping subarrays in linear time.
For example,

Input:  A[] = { -3, -2, 6, -3, 5, -9, 3, 4, -1, -8, 2 } Output: The maximum absolute difference is 19. The two subarrays are { 6, -3, 5 }, { -9, 3, 4, -1, -8 } whose sum of elements are 8 and -11, respectively. So, abs(8-(-11)) or abs(-11-8) = 19.

# Solution =============================================
def max_absolute_difference(arr)
  n = arr.length  # Get the length of the array
  
  # Step 1: Compute maximum and minimum subarray sums from the left
  max_left = Array.new(n, 0)  # Stores max sum ending at index i
  min_left = Array.new(n, 0)  # Stores min sum ending at index i
  
  max_sum = min_sum = arr[0]  # Initialize first element
  max_left[0] = min_left[0] = arr[0]
  
  (1...n).each do |i|
      # Either start new subarray at arr[i] or extend previous one
      max_sum = [arr[i], max_sum + arr[i]].max
      max_left[i] = [max_left[i - 1], max_sum].max
      
      min_sum = [arr[i], min_sum + arr[i]].min
      min_left[i] = [min_left[i - 1], min_sum].min
  end
  
  # Step 2: Compute maximum and minimum subarray sums from the right
  max_right = Array.new(n, 0)  # Stores max sum starting at index i
  min_right = Array.new(n, 0)  # Stores min sum starting at index i
  
  max_sum = min_sum = arr[-1]  # Initialize last element
  max_right[-1] = min_right[-1] = arr[-1]
  
  (n-2).downto(0) do |i|
      # Either start new subarray at arr[i] or extend previous one
      max_sum = [arr[i], max_sum + arr[i]].max
      max_right[i] = [max_right[i + 1], max_sum].max
      
      min_sum = [arr[i], min_sum + arr[i]].min
      min_right[i] = [min_right[i + 1], min_sum].min
  end
  
  # Step 3: Find the maximum absolute difference
  max_diff = 0
  (0...n-1).each do |i|
      # Check absolute difference between max-left and min-right
      max_diff = [max_diff, (max_left[i] - min_right[i + 1]).abs].max
      
      # Check absolute difference between min-left and max-right
      max_diff = [max_diff, (min_left[i] - max_right[i + 1]).abs].max
  end
  
  max_diff  # Return the maximum absolute difference found
end

# Comment =============================================
# This approach efficiently calculates the max absolute difference by:
# 1. Computing max and min subarray sums from the left.
# 2. Computing max and min subarray sums from the right.
# 3. Iterating through possible partition points to find the maximum absolute difference.
# The algorithm runs in O(n) time.

# Math/Calculations =============================================
# max_left[i]  -> Maximum sum of any subarray ending at index i.
# min_left[i]  -> Minimum sum of any subarray ending at index i.
# max_right[i] -> Maximum sum of any subarray starting at index i.
# min_right[i] -> Minimum sum of any subarray starting at index i.
# The absolute difference is calculated between these values.

# Example Usage
arr = [-3, -2, 6, -3, 5, -9, 3, 4, -1, -8, 2]
puts "The maximum absolute difference is: #{max_absolute_difference(arr)}"


# Problem =============================================
# 61. Given an integer array `nums` and two integers `x` and `y` present in it, 
# find the minimum absolute difference between indices of `x` and `y` 
# in a single traversal of the array.

# Solution =============================================
def min_index_difference(nums, x, y)
  # Initialize variables to track the last seen index of x and y
  last_x = -1
  last_y = -1
  min_diff = Float::INFINITY # Set to a very high value initially

  # Iterate through the array once
  nums.each_with_index do |num, index|
    if num == x
      last_x = index
      # If y has been found before, update the minimum difference
      min_diff = [min_diff, (last_x - last_y).abs].min if last_y != -1
    elsif num == y
      last_y = index
      # If x has been found before, update the minimum difference
      min_diff = [min_diff, (last_y - last_x).abs].min if last_x != -1
    end
  end

  # Return the minimum difference found
  min_diff == Float::INFINITY ? -1 : min_diff
end

# Comment =============================================
# - We traverse the array once (O(n) time complexity).
# - We use only a few variables (O(1) space complexity).
# - We update indices dynamically while iterating to track the closest x and y.
# - The condition ensures that we update `min_diff` only when both x and y have been seen.

# Math/Calculations =============================================
# Example 1:
# Input: nums = [1, 3, 5, 4, 8, 2, 4, 3, 6, 5], x = 3, y = 2
# Occurrences:
#  - 3 is at indices [1, 7]
#  - 2 is at index [5]
# Differences: |1-5| = 4, |7-5| = 2
# Minimum Difference = 2

# Example 2:
# Input: nums = [1, 3, 5, 4, 8, 2, 4, 3, 6, 5], x = 2, y = 5
# Occurrences:
#  - 2 is at index [5]
#  - 5 is at indices [2, 9]
# Differences: |5-2| = 3, |5-9| = 4
# Minimum Difference = 3

# Test Cases =============================================
puts min_index_difference([1, 3, 5, 4, 8, 2, 4, 3, 6, 5], 3, 2) # Output: 2
puts min_index_difference([1, 3, 5, 4, 8, 2, 4, 3, 6, 5], 2, 5) # Output: 3
puts min_index_difference([5, 1, 2, 3, 4, 5, 2, 7, 3, 8], 5, 3) # Output: 1
puts min_index_difference([1, 2, 3, 4, 5], 3, 5) # Output: 2
puts min_index_difference([1, 1, 1, 1], 1, 1) # Edge case: Output: 0





# Problem -----------------------------------------------------------------
60.Group elements of an array based on their first occurrence
Given an unsorted integer array containing many duplicate elements, rearrange it such that the same element appears together and the relative order of the first occurrence of each element remains unchanged.

# Example:
# Input:  [1, 2, 3, 1, 2, 1]   
# Output: [1, 1, 1, 2, 2, 3]

# Input:  [5, 4, 5, 5, 3, 1, 2, 2, 4]   
# Output: [5, 5, 5, 4, 4, 3, 1, 2, 2]


# Solution =============================================

def rearrange_elements(arr)
  # Step 1: Count occurrences of each element
  count_map = {}  # Hash to store how many times each number appears

  arr.each do |num|
    if count_map.has_key?(num)
      count_map[num] += 1  # Increase count if number exists
    else
      count_map[num] = 1   # Initialize count if it's the first time
    end
  end

  # Step 2: Keep track of first appearances in order
  ordered_keys = []  # Array to store first-time appearances

  arr.each do |num|
    ordered_keys << num unless ordered_keys.include?(num)
  end

  # Step 3: Build the final rearranged array
  result = []  # This will store the output

  ordered_keys.each do |num|
    count = count_map[num]  # Get count from count_map
    result += [num] * count # Add 'num' count times to the result
  end

  return result
end


# Edge Cases & Constraints ----------------------------------------------
# - What if the input array is empty? [] → Output: []
# - What if all elements are the same? [7, 7, 7, 7] → Output: [7, 7, 7, 7]
# - What if there is only one element? [10] → Output: [10]
# - What if numbers are negative or zero? [-1, -1, 0, 0, 2, 2] → Output: [-1, -1, 0, 0, 2, 2]
# - What if the input is very large? (Performance consideration)


# Alternative Approaches ----------------------------------------------
# Approach 1: Sorting & Grouping (NOT maintaining relative order)
# - We could sort the array and group elements, but this loses the order of first occurrences.
#
# Approach 2: Using a Hash with Arrays
# - Instead of tracking counts, we store occurrences in a hash of arrays.
#   Example: {5 => [5, 5, 5], 4 => [4, 4], 3 => [3], 1 => [1], 2 => [2, 2]}
# - Then flatten the hash values to get the final array.
#
# Approach 3: Use Ruby’s `group_by`
# - Ruby has a built-in `group_by` method that can help:
#   arr.group_by(&:itself).values.flatten
# - But this does NOT maintain the order of first occurrences.


# Complexity Analysis ----------------------------------------------
# - Step 1 (Counting occurrences) → O(n)
# - Step 2 (Tracking first occurrences) → O(n)
# - Step 3 (Building the final result) → O(n)
# - Overall Time Complexity: O(n)
#
# - Space Complexity: O(n) (Because we use extra arrays & hash)


# Real-World Applications ----------------------------------------------
# - Grouping similar items while keeping a processing order (e.g., warehouse inventory)
# - Maintaining log order while removing duplicates in event processing
# - Grouping users based on preference but keeping sign-up order
# - Processing task queues where duplicate tasks should be batched together


# Math/Calculations -------------------------------------------------------
# Example Input: [5, 4, 5, 5, 3, 1, 2, 2, 4]
# Step 1: Count Map -> {5=>3, 4=>2, 3=>1, 1=>1, 2=>2}
# Step 2: Ordered First Occurrences -> [5, 4, 3, 1, 2]
# Step 3: Rearrange Output -> [5, 5, 5, 4, 4, 3, 1, 2, 2]


# Test Cases --------------------------------------------------------------
puts rearrange_elements([1, 2, 3, 1, 2, 1]).inspect  # Output: [1, 1, 1, 2, 2, 3]
puts rearrange_elements([5, 4, 5, 5, 3, 1, 2, 2, 4]).inspect  # Output: [5, 5, 5, 4, 4, 3, 1, 2, 2]



# Problem -----------------------------------------------------------------
59. Print all triplets in an array with a sum less than or equal to a given number
Given an unsorted integer array, print all triplets in it with sum less than or equal to a given number.

For example,

Input: nums = [ 2, 7, 4, 9, 5, 1, 3 ]sum = 10 Output: Triplets are (1, 2, 3)(1, 2, 4)(1, 2, 5)(1, 2, 7)(1, 3, 4)(1, 3, 5)(1, 4, 5)(2, 3, 4)(2, 3, 5)

# Solution =============================================
# Function to find and print all triplets with a sum less than or equal to a given number
def find_triplets(nums, target_sum)
  # Sort the array to use the two-pointer technique
  nums.sort!
  n = nums.length

  # Iterate through the array to pick the first element
  (0...n-2).each do |i|
    left = i + 1  # Second element
    right = n - 1 # Third element

    # Check for valid triplets
    while left < right
      current_sum = nums[i] + nums[left] + nums[right]

      # If the sum is less than or equal to the target sum
      if current_sum <= target_sum
        # Print all triplets that include nums[i] and nums[left]
        (left..right).each do |j|
          puts "(#{nums[i]}, #{nums[left]}, #{nums[j]})"
        end
        left += 1  # Move the left pointer forward
      else
        right -= 1 # Decrease right pointer if sum is too large
      end
    end
  end
end

# Example usage
nums = [2, 7, 4, 9, 5, 1, 3]
target_sum = 10
find_triplets(nums, target_sum)



# Comment -----------------------------------------------------------------
Explanation:
Sort the array to ensure elements are in ascending order.
Iterate through each element as the first element of the triplet.
Use two pointers (left and right) to find pairs that, along with nums[i], have a sum ≤ target_sum.
If nums[i] + nums[left] + nums[right] is within the limit, all elements between left and right form valid triplets.
Move the left pointer forward if the sum is valid (to explore more possibilities), otherwise move the right pointer backward to reduce the sum.


# Math/Calculations -------------------------------------------------------
# Math Logic Behind Finding Triplets with a Sum ≤ Given Number

We are given an **unsorted array** of integers and a **target sum**. The goal is to find **all triplets (i, j, k)** where:

nums[i] + nums[j] + nums[k] ≤ target_sum

makefile
Copy
Edit

## Step 1: Sorting the Array
Sorting helps in efficiently finding pairs that satisfy the condition using the **two-pointer technique**.

### Given Input:
```ruby
nums = [2, 7, 4, 9, 5, 1, 3]
target_sum = 10
After Sorting:

nums = [1, 2, 3, 4, 5, 7, 9]
Step 2: Iterating Over Each Number as the First Element
We iterate through the sorted array, fixing one element at a time.

Use two pointers:
left = i + 1 (second element)
right = last index (third element)
If the sum is valid, all elements between left and right also form valid triplets.
Step-by-Step Calculations
Iteration 1: i = 0, nums[i] = 1
Checking pairs (nums[left], nums[right]) where left = 1 and right = 6.

left	right	Triplet (nums[i], nums[left], nums[right])	Sum	Valid?
2	9	(1, 2, 9)	12	❌ No
2	7	(1, 2, 7)	10	✅ Yes
2	5	(1, 2, 5)	8	✅ Yes
2	4	(1, 2, 4)	7	✅ Yes
2	3	(1, 2, 3)	6	✅ Yes
Valid triplets from this step:

ruby:

(1,2,3), (1,2,4), (1,2,5), (1,2,7)
Iteration 2: i = 1, nums[i] = 2
left	right	Triplet (nums[i], nums[left], nums[right])	Sum	Valid?
3	9	(2, 3, 9)	14	❌ No
3	7	(2, 3, 7)	12	❌ No
3	5	(2, 3, 5)	10	✅ Yes
3	4	(2, 3, 4)	9	✅ Yes
Valid triplets from this step:

ruby:
(2,3,4), (2,3,5)
Iteration 3: i = 2, nums[i] = 3
left	right	Triplet (nums[i], nums[left], nums[right])	Sum	Valid?
4	9	(3, 4, 9)	16	❌ No
4	7	(3, 4, 7)	14	❌ No
4	5	(3, 4, 5)	12	❌ No
No valid triplets for this iteration.

Final Output
The valid triplets are:

ruby:
(1, 2, 3)
(1, 2, 4)
(1, 2, 5)
(1, 2, 7)
(1, 3, 4)
(1, 3, 5)
(1, 4, 5)
(2, 3, 4)
(2, 3, 5)

Time Complexity Analysis
Sorting takes O(n log n).
Finding triplets runs in O(n²), as for each element, we use two pointers to find pairs.

Overall Complexity:
mathematica


O(n log n) + O(n²) = O(n²)

This is much more efficient than a brute-force approach (O(n³)) that checks every possible triplet.

Summary
Sort the array → Helps efficiently check valid triplets.
Fix one number and use two pointers → Finds all valid triplets efficiently.
If a triplet is valid, all numbers between left and right are also valid → Avoids unnecessary calculations.
This method ensures we get all triplets while keeping performance optimized. 🚀


---



# Problem -----------------------------------------------------------------
58.Replace each element of the array by its corresponding rank in the array
Given an array of distinct integers, replace each array element by its corresponding rank in the array.

The minimum array element has the rank 1; the second minimum element has a rank of 2, and so on… For example,

Input:  { 10, 8, 15, 12, 6, 20, 1 } Output: { 4, 3, 6, 5, 2, 7, 1 }

# Solution =============================================
# Define a method to replace each element with its rank
def replace_with_rank(arr)
  # Create a sorted copy of the array
  sorted_arr = arr.sort
  
  # Create a hash to store the rank for each element
  # The minimum element gets rank 1, next minimum gets rank 2, etc.
  rank_map = {}
  sorted_arr.each_with_index do |num, index|
    rank_map[num] = index + 1  # Adding 1 because rank starts at 1
  end
  
  # Replace each element in the original array with its rank
  ranked_arr = arr.map { |num| rank_map[num] }
  
  # Return the new array with ranks
  ranked_arr
end

# Example usage
input_array = [10, 8, 15, 12, 6, 20, 1]
output_array = replace_with_rank(input_array)

# Print the output array
puts output_array.inspect  # Expected output: [4, 3, 6, 5, 2, 7, 1]



# Comment -----------------------------------------------------------------
Explanation:
Sorting the Array:
We first sort the array so we can determine the rank (position) of each element.

Creating the Rank Map:
A hash (rank_map) is used to map each element to its rank. The smallest element gets rank 1, the next smallest gets rank 2, and so on.

Mapping Original Array to Ranks:
The original array is transformed by replacing each element with its corresponding rank from the rank_map.

Output:
Finally, the resulting array is printed, which in this case will output [4, 3, 6, 5, 2, 7, 1].

# Math/Calculations -------------------------------------------------------
Recap of the Math:
Sort: [10, 8, 15, 12, 6, 20, 1] → [1, 6, 8, 10, 12, 15, 20]
Assign Ranks:
1 → Rank 1
6 → Rank 2
8 → Rank 3
10 → Rank 4
12 → Rank 5
15 → Rank 6
20 → Rank 7
Map Original Array:
10 → 4
8 → 3
15 → 6
12 → 5
6 → 2
20 → 7
1 → 1


# Problem -----------------------------------------------------------------
57.Print all combination of numbers from 1 to n having sum n
Given a positive integer n, print all combinations of numbers between 1 and n having sum n.

For example,

For n = 5, the following combinations are possible: { 5 }{ 1, 4 }{ 2, 3 }{ 1, 1, 3 }{ 1, 2, 2 }{ 1, 1, 1, 2 }{ 1, 1, 1, 1, 1 }  For n = 4, the following combinations are possible: { 4 }{ 1, 3 }{ 2, 2 }{ 1, 1, 2 }{ 1, 1, 1, 1 }
# Solution =============================================
# Method to find and print all combinations of numbers summing to `n`
def find_combinations(n, current_combination = [], start = 1)
  # If the remaining sum becomes 0, we have found a valid combination
  if n == 0
    puts "{ #{current_combination.join(', ')} }" # Print the combination
    return
  end

  # Start looping from the current number to n
  (start..n).each do |i|
    # Add the current number to the combination
    current_combination << i

    # Recursively find combinations for the remaining sum (n - i)
    find_combinations(n - i, current_combination, i)

    # Backtrack: Remove the last number to explore other combinations
    current_combination.pop
  end
end

# Input example: Find combinations for n = 5
n = 5
find_combinations(n)



# Comment -----------------------------------------------------------------


# Math/Calculations -------------------------------------------------------




# Problem -----------------------------------------------------------------
56.Print all triplets that forms Geometric Progression
Given a sorted array of distinct positive integers, print all triplets that forms a geometric progression with an integral common ratio.

A geometric progression is a sequence of numbers where each term after the first is found by multiplying the previous one by a fixed, non-zero number called the common ratio. For example, sequence 2, 6, 18, 54,… is a geometric progression with a common ratio of 3.

 For example,

Input:  A[] = { 1, 2, 6, 10, 18, 54 } Output:2 6 186 18 54  
Input:  A[] = { 2, 8, 10, 15, 16, 30, 32, 64 } Output:2 8 328 16 3216 32 64  Input:  A[] = { 1, 2, 6, 18, 36, 54 } Output:2 6 181 6 366 18 54  
Input:  A[] = { 1, 2, 4, 16 } Output:1 2 41 4 16  
Input:  A[] = {1, 2, 3, 6, 18, 22}; Output:2 6 18
# Solution =============================================

# Function to find all triplets that form a geometric progression
def find_gp_triplets(arr)
  n = arr.length

  # Iterate through each pair in the array
  (0...n - 1).each do |j|
    i = j - 1
    k = j + 1

    # Use the two-pointer technique to find triplets
    while i >= 0 && k < n
      # Check if the triplet forms a geometric progression
      if arr[j] ** 2 == arr[i] * arr[k]
        # Print the triplet
        puts "#{arr[i]} #{arr[j]} #{arr[k]}"
        i -= 1
        k += 1
      elsif arr[j] ** 2 < arr[i] * arr[k]
        i -= 1
      else
        k += 1
      end
    end
  end
end

# Example test cases
arrays = [
  [1, 2, 6, 10, 18, 54],
  [2, 8, 10, 15, 16, 30, 32, 64],
  [1, 2, 6, 18, 36, 54],
  [1, 2, 4, 16],
  [1, 2, 3, 6, 18, 22]
]

# Run the function on each test case
arrays.each do |arr|
  puts "Input: #{arr}"
  find_gp_triplets(arr)
  puts "----------------"
end



# Comment -----------------------------------------------------------------

# Explanation:
# The function iterates through each middle element in the array (index j).
# It uses two pointers:
# i (moves backward from j)
# k (moves forward from j)
# The condition arr[j] ** 2 == arr[i] * arr[k] checks if the triplet forms a geometric progression.
# If a valid triplet is found, it's printed, and both pointers are moved accordingly.
# If the middle element squared is too small, increment k, otherwise decrement i.

# Math/Calculations -------------------------------------------------------

Geometric Progression (GP) Definition
A sequence of numbers forms a geometric progression if each term (except the first) is obtained by multiplying the previous term by a constant common ratio (r).

Mathematically, a triplet 

(a,b,c) forms a geometric progression if:

b^2=a×c
Step-by-Step Explanation with Example
Example 1:
Input:

A=[1,2,6,10,18,54]

We will iterate through the array and check for triplets that satisfy the GP condition.

Step 1: Choose the middle element
Let’s take 

j=1, meaning 

A[j]=2, and set two pointers:

i (moves left, starts from 

j−1)

k (moves right, starts from 

j+1)
Step 2: Check the GP condition
Checking triplet (1, 2, 6):

2^2 =1×6
4 ≠ 6
(Not a GP triplet, move k forward)

Checking triplet (1, 2, 10):

2^2 =1×10

4 ≠ 10
(Not a GP triplet, move k forward)

Checking triplet (2, 6, 18):


6^2 =2×18
36 = 36 (Valid GP triplet)

Step 3: Move pointers and continue
After finding a valid triplet, move 

i left and k right and repeat the process.

Checking triplet (6, 18, 54):
18^2=6×54
324 = 324 (Valid GP triplet)

So the valid triplets for this input are:


(2,6,18),(6,18,54)

Example 2:
Input:

A=[2,8,10,15,16,30,32,64]

1. Checking triplet (2, 8, 32):

8^2 =2×32
64 = 64 (Valid GP triplet)

2. Checking triplet (8, 16, 32):

16^2  =8×32
256 = 256 (Valid GP triplet)

3. Checking triplet (16, 32, 64):

1024 = 1024 (Valid GP triplet)

So the valid triplets for this input are:

(2,8,32),(8,16,32),(16,32,64)

Algorithm Breakdown

1. Loop through each middle element:
Assume each element 
𝐴
[
𝑗
]
A[j] is the middle of a potential triplet.
Use two pointers to check pairs:
One pointer moves left 
𝑖
i and one right 
𝑘
k.
Check if triplet satisfies the GP formula:
If 
𝐴
[
𝑗
]
2
=
𝐴
[
𝑖
]
×
𝐴
[
𝑘
]
A[j] 
2
 =A[i]×A[k], it's a valid triplet.
If not, adjust pointers.
Time Complexity Analysis
The outer loop runs 

O(n).
The inner two-pointer search runs 

O(n).
Overall complexity: 
𝑂
(
𝑛
2
)
O(n 
2
 ).
Final Thoughts
The approach efficiently finds geometric triplets in sorted arrays.
The formula 
𝑏
2
=
𝑎
×
𝑐
b 
2
 =a×c is crucial for identifying valid sequences.
The two-pointer technique helps avoid unnecessary comparisons and optimizes the search.



# Problem -----------------------------------------------------------------

# 55.Print all Triplets that forms Arithmetic Progression
# Given a sorted array of distinct positive integers, print all triplets that forms an arithmetic progression with an integral common difference.

# An arithmetic progression is a sequence of numbers such that the difference between the consecutive terms is constant. For instance, sequence 5, 7, 9, 11, 13, 15, … is an arithmetic progression with a common difference of 2.

#  For example,

# Input:  A[] = { 5, 8, 9, 11, 12, 15 } Output:5 8 119 12 15  Input:  A[] = { 1, 3, 5, 6, 8, 9, 15 } Output:1 3 51 5 93 6 91 8 153 9 15


# Solution =============================================
# Define a method to find and print all triplets in an array
# that form an arithmetic progression with an integer common difference.
def find_arithmetic_triplets(arr)
  n = arr.length # Get the size of the array
  
  # Loop through the array to fix the middle element of the triplet
  (1...n - 1).each do |j|
    i = j - 1 # Pointer for the first element of the triplet
    k = j + 1 # Pointer for the last element of the triplet
    
    # Check triplets using two-pointer technique
    while i >= 0 && k < n
      # If a triplet is found (arr[j] - arr[i] == arr[k] - arr[j])
      if arr[j] - arr[i] == arr[k] - arr[j]
        # Print the triplet
        puts "#{arr[i]} #{arr[j]} #{arr[k]}"
        i -= 1 # Move the left pointer left
        k += 1 # Move the right pointer right
      elsif arr[j] - arr[i] < arr[k] - arr[j]
        i -= 1 # Move the left pointer left if difference is smaller
      else
        k += 1 # Move the right pointer right if difference is larger
      end
    end
  end
end

# Example usage
arr1 = [5, 8, 9, 11, 12, 15]
puts "Triplets in array #{arr1}:"
find_arithmetic_triplets(arr1)

arr2 = [1, 3, 5, 6, 8, 9, 15]
puts "\nTriplets in array #{arr2}:"
find_arithmetic_triplets(arr2)



# Comment -----------------------------------------------------------------
Explanation:
Input: The method takes a sorted array of distinct positive integers.
Logic:
The middle element of the triplet (arr[j]) is fixed, and two pointers (i for the first element, k for the last element) are used to find other elements.
If the difference between consecutive elements (arr[j] - arr[i] and arr[k] - arr[j]) is equal, a triplet is printed.
Adjust the pointers (i and k) based on the comparison of differences to find more triplets.
Output: The triplets are printed in the format "a b c".


# Math/Calculations -------------------------------------------------------
Logic of the Algorithm
Fix the Middle Element 
𝑏
b:

Start by looping through the array, considering each element as 
b, except the first and last elements.
This ensures there is a potential 
a (before 
b) and 
c (after 
b).
Use Two Pointers for 
a and 
c:

Initialize pointers 
𝑖
i (to the left of 
𝑏
b) and 
𝑘
k (to the right of 
𝑏
b).
Calculate:
Difference Left: 
𝑏
−
𝑎
=
arr[j] - arr[i]
Difference Left: b−a=arr[j] - arr[i]
Difference Right: 
𝑐
−
𝑏
=
arr[k] - arr[j]
Difference Right: c−b=arr[k] - arr[j]
Check the Differences:

If the differences are equal (

b−a=c−b):
The triplet 

(a,b,c) forms an AP, so print it.
Move both pointers inward: 
𝑖
i←i−1, 

k←k+1.
If 

b−a<c−b:
Move 

i left to increase the left difference (

b−a).
If 

b−a>c−b:
Move 
k right to increase the right difference (

c−b).


# Problem -----------------------------------------------------------------
# 54.Quickselect Algorithm
# Quickselect is a selection algorithm to find the k'th smallest element in an unordered list. It is closely related to the Quicksort sorting algorithm. Like Quicksort, it is efficient traditionally and offers good average-case performance, but has a poor worst-case performance.

#  For example,

# Input: [7, 4, 6, 3, 9, 1]k = 2 Output: k’th smallest array element is 3  Input: [7, 4, 6, 3, 9, 1]k = 1 Output: k’th smallest array element is 1 

# Solution =============================================
# Quickselect Algorithm to find the k-th smallest element
def quickselect(array, k)
  # Helper function to partition the array
  def partition(arr, left, right)
    pivot = arr[right] # Choose the last element as the pivot
    pivot_index = left # The initial pivot index

    # Move elements smaller than the pivot to the left
    for i in left...right
      if arr[i] <= pivot
        arr[i], arr[pivot_index] = arr[pivot_index], arr[i] # Swap elements
        pivot_index += 1
      end
    end

    # Swap the pivot element to its correct position
    arr[pivot_index], arr[right] = arr[right], arr[pivot_index]
    return pivot_index # Return the pivot index
  end

  left = 0
  right = array.length - 1

  while left <= right
    pivot_index = partition(array, left, right)

    # Check if the pivot index matches the k-th position
    if pivot_index == k - 1
      return array[pivot_index] # Found the k-th smallest element
    elsif pivot_index < k - 1
      left = pivot_index + 1 # Search on the right side
    else
      right = pivot_index - 1 # Search on the left side
    end
  end
end

# Example Usage
array = [7, 4, 6, 3, 9, 1]
k = 2
puts "The #{k}-th smallest element is #{quickselect(array, k)}"

k = 1
puts "The #{k}-th smallest element is #{quickselect(array, k)}"



# Comment -----------------------------------------------------------------
# Explanation
# Partition Function:

# Selects a pivot element (last element in the array).
# Rearranges the array so elements smaller than the pivot are on the left and larger ones on the right.
# Returns the index of the pivot after reordering.
# Quickselect Logic:

# Checks if the pivot index equals k-1 (since arrays are zero-indexed).
# If the pivot index is smaller than k-1, search the right side.
# If it's larger, search the left side.
# This reduces the search space and avoids fully sorting the array.
# Example:

# For array = [7, 4, 6, 3, 9, 1] and k = 2:
# The algorithm partitions the array and narrows down to find the 2nd smallest element (3).

# Math/Calculations -------------------------------------------------------
Step-by-Step Process
Goal: Find the 2nd smallest element.

Step 1: Initial Input
Array: [7, 4, 6, 3, 9, 1]

k=2 → We are looking for the element at index 
𝑘

k−1=1 (since arrays are zero-indexed).

Step 2: Partition the Array
Select the pivot: The last element (1 in this case).
Rearrange the array so elements smaller than the pivot go to the left, and larger ones go to the right.
Start with:

Array: [7, 4, 6, 3, 9, 1]
Pivot: 1
Compare each element with the pivot (1):

7 > 1 → No swap.
4 > 1 → No swap.
6 > 1 → No swap.
3 > 1 → No swap.
9 > 1 → No swap.
Swap the pivot (1) with the first element (7):

Result: [1, 4, 6, 3, 9, 7]
Pivot index: 0

Step 3: Check Pivot Index
Pivot index = 0

k−1=1
Pivot index is less than 

k−1, so search the right side of the array:
Subarray: [4, 6, 3, 9, 7]

Step 4: Partition the Right Subarray
Select the pivot: The last element (7 in this case).
Rearrange the array.
Start with:

Subarray: [4, 6, 3, 9, 7]
Pivot: 7
Compare each element with the pivot (7):

4 < 7 → No swap, move to the next.
6 < 7 → No swap, move to the next.
3 < 7 → No swap, move to the next.
9 > 7 → No swap.
Swap the pivot (7) with the first element larger than it (9):

Result: [4, 6, 3, 7, 9]
Pivot index: 3

Step 5: Check Pivot Index
Pivot index = 3


k−1=1
Pivot index is greater than 


k−1, so search the left side of the array:
Subarray: [4, 6, 3]

Step 6: Partition the Left Subarray
Select the pivot: The last element (3 in this case).
Rearrange the array.
Start with:

Subarray: [4, 6, 3]
Pivot: 3
Compare each element with the pivot (3):

4 > 3 → No swap.
6 > 3 → No swap.
Swap the pivot (3) with the first element (4):

Result: [3, 6, 4]
Pivot index: 0

Step 7: Check Pivot Index
Pivot index = 0

k−1=1
Pivot index is less than 

k−1, so search the right side of the array:
Subarray: [6, 4]
Step 8: Partition the Right Subarray
Select the pivot: The last element (4 in this case).
Rearrange the array.
Start with:

Subarray: [6, 4]
Pivot: 4
Compare each element with the pivot (4):

6 > 4 → No swap.
Swap the pivot (4) with the first element (6):

Result: [4, 6]
Pivot index: 0
Step 9: Check Pivot Index
Pivot index = 0

k−1=1
Pivot index is less than 

k−1, so search the right side of the array:
Subarray: [6]
Step 10: Base Case
Subarray: [6] → Only one element left, which is the 2nd smallest element.
Return: 3
Summary of Steps
Original Array: [7, 4, 6, 3, 9, 1]
Partition Results:
After Step 2: [1, 4, 6, 3, 9, 7] (Pivot: 1)
After Step 4: [4, 6, 3, 7, 9] (Pivot: 7)
After Step 6: [3, 6, 4] (Pivot: 3)
After Step 8: [4, 6] (Pivot: 4)
Base Case: [3] → 2nd smallest element is 3.


# Problem -----------------------------------------------------------------
53.Find two odd occurring element in an array without using any extra space
Given an integer array, all elements occur an even number of times except for two elements that occur an odd number of times. Find these two odd-occurring elements in linear time and without using any extra memory.
For example,

Input:  arr[] = [4, 3, 6, 2, 4, 2, 3, 4, 3, 3] Output: The odd occurring elements are 4 and 6 6 appears once.2 appears twice.4 appears thrice.3 appears 4 times.
# Solution =============================================



# Comment -----------------------------------------------------------------
Explanation for Beginners
What is XOR?

1. XOR is a simple math operation that compares two bits. If they are different, the result is 1; if they are the same, the result is 0.
Example:
vbnet:
1 XOR 1 = 0
1 XOR 0 = 1
0 XOR 0 = 0
2.Why XOR is useful here?

If a number appears an even number of times, XOR will cancel it out. For example:
vbnet:
4 XOR 4 = 0
If a number appears an odd number of times, XOR will keep it. For example:
vbnet:
4 XOR 0 = 4

3.Steps in the Code:

Step 1: XOR all numbers together. This cancels out the numbers that occur an even number of times and leaves the XOR of the two odd-occurring numbers.
Step 2: Find a bit that is different between the two odd numbers (rightmost set bit). This is used to separate the two numbers into groups.
Step 3: XOR the numbers in each group to find the two odd-occurring numbers.

4. Breaking It Down:

Let’s take the example array [4, 3, 6, 2, 4, 2, 3, 4, 3, 3]:
After XORing all numbers: combined_xor = 4 XOR 6 = 2
Rightmost set bit: 2 & -2 = 2 (binary: 10).
Group 1 (bit not set): Numbers like 6 and 2.
Group 2 (bit set): Numbers like 4 and 3.




# Math/Calculations -------------------------------------------------------
Output
When you run this program with the example input:
ruby code
arr = [4, 3, 6, 2, 4, 2, 3, 4, 3, 3]

The program prints:
sql code
The odd occurring elements are 4 and 6


# Problem -----------------------------------------------------------------
52.Find odd occurring element in an array in single traversal
Given an integer array, duplicates are present in it in a way that all duplicates appear an even number of times except one which appears an odd number of times. Find that odd appearing element in linear time and without using any extra memory.

For example,

Input:  arr[] = [4, 3, 6, 2, 6, 4, 2, 3, 4, 3, 3] Output: The odd occurring element is 4
# Solution =============================================
# Function to find the odd-occurring element
def find_odd_occurring_element(arr)
  result = 0 # Initialize result to 0
  arr.each do |num| # Iterate over each number in the array
    result ^= num # Perform XOR operation with the current number
  end
  result # The result will hold the odd-occurring number
end

# Input array
arr = [4, 3, 6, 2, 6, 4, 2, 3, 4, 3, 3]

# Call the function and print the result
puts "The odd occurring element is #{find_odd_occurring_element(arr)}"



# Comment -----------------------------------------------------------------
Explanation:
XOR operation (^):
XOR of a number with itself is 0 (e.g., 4 ^ 4 = 0).
XOR of a number with 0 is the number itself (e.g., 0 ^ 4 = 4).
The XOR operation cancels out all numbers appearing an even number of times, leaving only the number that appears an odd number of times.
This approach works in linear time (O(n)) and uses no extra memory.

# Math/Calculations -------------------------------------------------------
Here’s the step-by-step explanation of how the XOR (^) operation works with your input array:

Input Array:
arr = [4, 3, 6, 2, 6, 4, 2, 3, 4, 3, 3]

Initialize result to 0:
We will XOR all elements in the array step by step. The property of XOR ensures that pairs of the same number cancel each other out, and only the odd-occurring number remains.

Step-by-Step XOR Process:
1. Initial result = 0
2. XOR 0 with 4:
result = 0 ^ 4 = 4
3. XOR 4 with 3:
result = 4 ^ 3 = 7
4. XOR 7 with 6:
result = 7 ^ 6 = 1
5. XOR 1 with 2:
result = 1 ^ 2 = 3
6. XOR 3 with 6:
result = 3 ^ 6 = 5
7. XOR 5 with 4:
result = 5 ^ 4 = 1
8. XOR 1 with 2:
result = 1 ^ 2 = 3
9. XOR 3 with 3:
result = 3 ^ 3 = 0
10. XOR 0 with 4:
result = 0 ^ 4 = 4
11. XOR 4 with 3:
result = 4 ^ 3 = 7
12. XOR 7 with 3:
result = 7 ^ 3 = 4
Final result:
After XORing all the elements, the result is 4. This is the number that appears an odd number of times in the array.

Why does this work?
Pairs cancel out: For example, 4 ^ 4 = 0 and 3 ^ 3 = 0.
Odd element remains: The odd-occurring number (4) is left in the result because it doesn’t get completely canceled out.


# Problem -----------------------------------------------------------------
51.Print all quadruplets with given sum | 4-sum problem extended
Given an unsorted integer array, print all distinct four elements tuple (quadruplets) in it, having a given sum.

For example,

Input: A[] = [2, 7, 4, 0, 9, 5, 1, 3]target = 20 Output: Below are the quadruplets with sum 20 (0, 4, 7, 9)(1, 3, 7, 9)(2, 4, 5, 9)
# Solution =============================================
require 'set'

def find_quadruplets(arr, target)
  n = arr.length            # Total numbers in the array
  result_set = Set.new       # Store unique groups of 4 numbers

  # Pick 4 different numbers from the array
  for i in 0...n
    for j in i+1...n
      for k in j+1...n
        for l in k+1...n
          # If their sum matches the target, save the group
          if arr[i] + arr[j] + arr[k] + arr[l] == target
            quadruplet = [arr[i], arr[j], arr[k], arr[l]].sort  # Sort to avoid duplicate groups
            result_set.add(quadruplet)  # Add unique group
          end
        end
      end
    end
  end

  # Print each group
  result_set.each do |quad|
    puts "(#{quad.join(', ')})"
  end
end

# Example input
arr = [2, 7, 4, 0, 9, 5, 1, 3]
target = 20

puts "Quadruplets with sum #{target}:"
find_quadruplets(arr, target)



# Comment -----------------------------------------------------------------
# Here is a approach step-by-step with comments in the code:

# Use nested loops to generate all possible combinations of 4 numbers.
# Use a set to ensure the quadruplets are distinct.
# Check if the sum of the four numbers equals the target sum.
# Print the result.
# Here's the complete code:

# Find Quadruplets Sum
# How the Code Works:
# Nested Loops: The code uses four nested loops to pick all combinations of four elements.
# Sum Check: It checks if the sum of the selected quadruplet equals the target.
# Set for Uniqueness: To avoid duplicates, the quadruplet is sorted and added to a set (result_set).
# Print Results: The distinct quadruplets are printed one by one.

# Math/Calculations -------------------------------------------------------
# Example Input:
# Array: [2, 7, 4, 0, 9, 5, 1, 3]
# Target Sum: 20
# Steps and Calculations:
# The code checks all combinations of 4 numbers from the array and sums them to see if they match the target. Here's the process:

# Start with the first 4 numbers and move through all combinations of 4 indices (i, j, k, l).

# Iterate through combinations:

# Loop i goes from the 1st index to the 2nd-to-last index.
# Loop j starts after i.
# Loop k starts after j.
# Loop l starts after k.
# Add numbers together: For each combination, add the 4 numbers at indices i, j, k, l. For example:

# Indices (i, j, k, l)	Numbers	Sum	Check
# (0, 2, 4, 5)	2, 4, 9, 5	2+4+9+5 = 20	✅ Match
# (1, 2, 4, 6)	7, 4, 9, 0	7+4+9+0 = 20	❌ No Match
# (1, 3, 4, 6)	7, 0, 9, 1	7+0+9+1 = 17	❌ No Match
# (2, 4, 5, 6)	4, 9, 5, 1	4+9+5+1 = 19	❌ No Match
# (0, 4, 5, 6)	0, 4, 7, 9	0+4+7+9 = 20	✅ Match
# Sorting and storing:
# Each valid group of numbers is sorted (to ensure they appear in ascending order).
# Unique combinations are stored using a Set.
# Valid Quadruplets Found:
# The final valid combinations for the example input [2, 7, 4, 0, 9, 5, 1, 3] with target sum 20 are:

# (0, 4, 7, 9) → 0 + 4 + 7 + 9 = 20
# (1, 3, 7, 9) → 1 + 3 + 7 + 9 = 20
# (2, 4, 5, 9) → 2 + 4 + 5 + 9 = 20
# Output:
Python code:
Quadruplets with sum 20:
(0, 4, 7, 9)
(1, 3, 7, 9)
(2, 4, 5, 9)
# 
# # Summary:
# # The code tries all possible combinations of 4 numbers.
# # For each combination, it checks if their sum equals the target.
# # Only valid combinations are printed as the output.


# Problem -----------------------------------------------------------------
# 50.4 sum problem | Quadruplets with given sum
# 4-sum problem: Given an unsorted integer array, check if it contains four elements tuple (quadruplets) having a given sum.

# For example,

# Input: nums = [ 2, 7, 4, 0, 9, 5, 1, 3 ]target = 20 Output: Quadruplet exists. Below are quadruplets with the given sum 20 (0, 4, 7, 9)(1, 3, 7, 9)(2, 4, 5, 9)

# Solution =============================================
def four_sum(nums, target)
  nums.sort!
  result = []

  (0...nums.length - 3).each do |i|
    (i + 1...nums.length - 2).each do |j|
      left = j + 1
      right = nums.length - 1

      while left < right
        current_sum = nums[i] + nums[j] + nums[left] + nums[right]

        if current_sum == target
          result << [nums[i], nums[j], nums[left], nums[right]]
          left += 1 while left < right && nums[left] == nums[left + 1]
          right -= 1 while left < right && nums[right] == nums[right - 1]
          left += 1
          right -= 1
        elsif current_sum < target
          left += 1
        else
          right -= 1
        end
      end
    end
  end

  result
end

nums = [2, 7, 4, 0, 9, 5, 1, 3]
target = 20
result = four_sum(nums, target)

if result.empty?
  puts "No quadruplets found."
else
  puts "Quadruplets with the given sum #{target}:"
  result.each { |quadruplet| puts quadruplet.inspect }
end


# Comment -----------------------------------------------------------------
Explanation:

Sorting: The nums array is sorted to efficiently find quadruplets.

Iteration: The code iterates through the array using four pointers (i, j, left, and right).

Two Pointers: The left and right pointers help find pairs that sum up to the remaining value needed for the target sum.

Checking Sum: The sum of the elements at the four pointers is calculated (current_sum).

Target Match: If current_sum equals the target, the quadruplet is added to the result.

Duplicate Handling: The code handles duplicate quadruplets by skipping over identical elements.

Adjusting Pointers: If current_sum is less than target, left is incremented to increase the sum. If current_sum is greater than target, right is decremented to decrease the sum.

Output:

Quadruplets with the given sum 20:
[0, 4, 7, 9]
[1, 3, 7, 9]
[2, 4, 5, 9]

# Math/Calculations -------------------------------------------------------



# Problem -----------------------------------------------------------------
49.Find pairs with given difference k in the array | Constant space solution
Given an unsorted integer array, find all pairs with a given difference k in it without using any extra space.

For example,

Input: arr = [1, 5, 2, 2, 2, 5, 5, 4]k = 3 Output: (2, 5) and (1, 4)

# Solution =============================================
def find_pairs_with_difference(arr, k)
  # Sort the array to enable two-pointer technique
  arr.sort!
  
  i = 0
  j = 1
  n = arr.length
  
  result = []

  while i < n && j < n
    # Calculate the difference
    diff = arr[j] - arr[i]

    if diff == k
      # Add the pair to the result if the difference is equal to k
      result << [arr[i], arr[j]]
      # Move both pointers to avoid duplicates
      i += 1
      j += 1
      # Skip duplicates
      i += 1 while i < n && arr[i] == arr[i - 1]
      j += 1 while j < n && arr[j] == arr[j - 1]
    elsif diff < k
      # Increase j to make the difference larger
      j += 1
    else
      # Increase i to make the difference smaller
      i += 1
      # Ensure i does not overtake j
      j = [j, i + 1].max
    end
  end
  
  result
end

# Example usage
arr = [1, 5, 2, 2, 2, 5, 5, 4]
k = 3
pairs = find_pairs_with_difference(arr, k)
pairs.each { |pair| puts "(#{pair[0]}, #{pair[1]})" }



# Comment -----------------------------------------------------------------
# Explanation:
# 1. Sort the array to make it easier to find pairs with the given difference.
# 2. Use two pointers, i and j. Start i at the beginning and j slightly ahead.
# 3. Compare the difference between arr[j] and arr[i]:
#    If the difference is equal to k, add the pair to the result and move both pointers.
#    If the difference is less than k, move j to increase the difference.
#    If the difference is more than k, move i to decrease the difference.
# 4. Avoid duplicate pairs by skipping repeated elements.
Notes:
The array is modified in-place due to sorting.
Time complexity: O(nlogn) for sorting + O(n) for the two-pointer traversal = O(nlogn).
Space complexity: O(1) (no extra space apart from variables).

# Math/Calculations -------------------------------------------------------

Let’s calculate the solutions step by step for the given problem with arr = [1, 5, 2, 2, 2, 5, 5, 4] and k = 3.

Step 1: Sort the array
We sort the array in ascending order for easier traversal: Sorted array: [1, 2, 2, 2, 4, 5, 5, 5]

--------------------------

Step 2: Initialize two pointers
Pointer i starts at the beginning (i = 0).
Pointer j starts at the next position (j = 1).
We will calculate the difference between arr[j] and arr[i] and check if it equals k = 3.

--------------------------

Step 3: Traverse and calculate differences

Pair (i=0, j=1):
arr[i] = 1, arr[j] = 2
Difference = arr[j] - arr[i] = 2 - 1 = 1
Difference is less than k. Increment j to make the difference larger (j = 2).

Pair (i=0, j=2):
arr[i] = 1, arr[j] = 2
Difference = arr[j] - arr[i] = 2 - 1 = 1
Same result, increment j (j = 3).

Pair (i=0, j=3):
arr[i] = 1, arr[j] = 2
Difference = arr[j] - arr[i] = 2 - 1 = 1
Still less than k. Increment j (j = 4).

Pair (i=0, j=4):
arr[i] = 1, arr[j] = 4
Difference = arr[j] - arr[i] = 4 - 1 = 3

Difference equals k! Add the pair (1, 4) to the result.
Increment both pointers:
i = 1, j = 5.

--------------------------

Pair (i=1, j=5):
arr[i] = 2, arr[j] = 5
Difference = arr[j] - arr[i] = 5 - 2 = 3

Difference equals k! Add the pair (2, 5) to the result.
Increment both pointers:

i = 2, j = 6.

--------------

Pair (i=2, j=6):
arr[i] = 2, arr[j] = 5
Difference = arr[j] - arr[i] = 5 - 2 = 3

This pair is the same as the previous one. Skip duplicates:
Increment i to 3.
Increment j to 7.

--------------------------

Pair (i=3, j=7):
arr[i] = 2, arr[j] = 5
Difference = arr[j] - arr[i] = 5 - 2 = 3
This is another duplicate. Increment pointers:
i = 4, j = 8.

--------------------------

Step 4: End of traversal
j has now gone beyond the length of the array. The traversal stops.
Final Result:
The pairs with a difference of k = 3 are:

(1, 4)
(2, 5)
Math Summary:
Differences calculated step by step:
2 - 1 = 1 (skip)
4 - 1 = 3 → Pair (1, 4)
5 - 2 = 3 → Pair (2, 5)
Skipped duplicates for (2, 5).
These calculations align with the output of the program.


# Problem -----------------------------------------------------------------
48.Find pairs with given difference k in the array
Given an unsorted integer array, print all pairs with a given difference k in it.

For example,

Input: arr = [1, 5, 2, 2, 2, 5, 5, 4]k = 3 Output: (2, 5) and (1, 4)

# Solution =============================================
def find_pairs_with_difference(arr, k)
  # Create a hash to store elements of the array
  element_hash = {}
  pairs = []

  # Populate the hash with array elements as keys
  arr.each do |num|
    element_hash[num] = true
  end

  # Find pairs with the given difference
  arr.each do |num|
    # Check if the element num + k exists in the hash
    if element_hash[num + k]
      pairs << [num, num + k] # Store the pair
    end
  end

  # Print the pairs in a readable format
  pairs.each do |pair|
    puts "(#{pair[0]}, #{pair[1]})"
  end
end

# Input
arr = [1, 5, 2, 2, 2, 5, 5, 4]
k = 3

# Call the function
find_pairs_with_difference(arr, k)



# Comment -----------------------------------------------------------------

Code Explanation:
Use a hash table (dictionary) to store elements of the array.
Loop through the array and check if there exists an element in the hash table such that the difference is k.
Print the pairs while ensuring no duplicates.

# Math/Calculations -------------------------------------------------------
To find all pairs in the array [1,5,2,2,2,5,5,4] with a difference 
k=3, let’s go step-by-step mathematically.

Input:
Array: [1,5,2,2,2,5,5,4]
Difference (k): 3

Step 1: Check Each Element
For each element n in the array, calculate n+k and check if it exists in the array.

Iteration 1:
Current element: n=1
Calculate: 1+3=4
Check: Is 4 in the array? Yes.
Pair: (1,4)

Iteration 2:
Current element: n=5
Calculate: 5+3=8
Check: Is 8 in the array? No.
No pair.

Iteration 3:
Current element: n=2
Calculate: 2+3=5
Check: Is 5 in the array? Yes.
Pair: (2,5)

Iteration 4:
Current element: n=2 (duplicate)
Calculate: 2+3=5
Check: Is 5 in the array? Yes.
Pair: (2,5) (duplicate, ignored later).

Iteration 5:
Current element: n=2 (duplicate)
Calculate: 2+3=5
Check: Is 5 in the array? Yes.
Pair: (2,5) (duplicate, ignored later).

Iteration 6:
Current element: n=5
Calculate: 5+3=8
Check: Is 8 in the array? No.
No pair.

Iteration 7:
Current element: n=5 (duplicate)
Calculate: 5+3=8
Check: Is 8 in the array? No.
No pair.

Iteration 8:
Current element: n=4
Calculate: 4+3=7
Check: Is 7 in the array? No.
No pair.

Step 2: Remove Duplicates
From the valid pairs (1,4), (2,5), (2,5), and (2,5), remove duplicates.

Unique pairs:

(1,4)
(2,5)



# Problem -----------------------------------------------------------------
47.Maximum Product Subset Problem
Given an integer array, find the maximum product of its elements among all its subsets.

For example,

Input:  nums[] = { -6, 4, -5, 8, -10, 0, 8 } Output: The maximum product of a subset is 15360 The subset with the maximum product of its elements is { -6, 4, 8, -10, 8 }   Input:  nums[] = { 4, -8, 0, 8 } Output: The maximum product of a subset is 32 The subset with the maximum product of its elements is { 4, 8 }
# Solution =============================================

# Function to find the maximum product of elements in subsets
def max_subset_product(nums)
  # Remove zeros as they don't contribute to the product
  nums.reject! { |num| num == 0 }

  # If the array becomes empty after removing zeros, return 0
  return 0 if nums.empty?

  # Separate negative and positive numbers
  negative_nums = nums.select { |num| num < 0 }
  positive_nums = nums.select { |num| num > 0 }

  # If there's an odd number of negative numbers, remove the largest negative number
  if negative_nums.size.odd?
    negative_nums.delete(negative_nums.max)
  end

  # Combine the remaining negative and positive numbers
  valid_subset = negative_nums + positive_nums

  # Calculate the product of the valid subset
  max_product = valid_subset.reduce(1) { |product, num| product * num }

  max_product
end

# Example usage
nums1 = [-6, 4, -5, 8, -10, 0, 8]
nums2 = [4, -8, 0, 8]

puts "Maximum product for nums1: #{max_subset_product(nums1)}"
puts "Maximum product for nums2: #{max_subset_product(nums2)}"



# Comment -----------------------------------------------------------------
# To solve this problem, we can use the following approach:

# Remove Zeros: Any subset that includes zero will have a product of zero. So, we exclude zeros.
# Count Negative Numbers: Negative numbers are tricky because multiplying an odd number of them results in a negative product. To maximize the product:
# If there's an odd number of negative numbers, exclude the largest (closest to zero) negative number.
# If all negatives can be paired, include them all.
# Include Positive Numbers: Positive numbers always contribute to maximizing the product.

# Explanation of the Code

# 1. Reject Zeros: Zeros are removed using reject!.
# 2. Handle Negatives: Negative numbers are adjusted based on their count.
# 3. Calculate Product: The product of the remaining subset is calculated using reduce.

# Math/Calculations -------------------------------------------------------
Maximum product for nums1: 15360
Maximum product for nums2: 32

---------------------------------------------------------------------------

Example 1: nums = [-6, 4, -5, 8, -10, 0, 8]

1. Remove zeros: The array becomes [-6, 4, -5, 8, -10, 8].

2. Separate negatives and positives:

Negatives: [-6, -5, -10]
Positives: [4, 8, 8]

3. Odd count of negatives:

There are 3 negatives, which is odd. To maximize the product, exclude the largest (closest to zero) negative number: -5.
Remaining negatives: [-6, -10]

4. Final subset:

Combine the remaining negatives and all positives: [-6, -10, 4, 8, 8]

5. Calculate the product:


−6×−10=60(negative × negative = positive)

60×4=240

240×8=1920

1920×8=15360
Maximum product: 15360

Example 2: nums = [4, -8, 0, 8]
1. Remove zeros: The array becomes [4, -8, 8].

2. Separate negatives and positives:

Negatives: [-8]
Positives: [4, 8]
3. Odd count of negatives:

There is 1 negative number, which is odd. To maximize the product, exclude the negative number.
Remaining negatives: []

4. Final subset:

Only positives remain: [4, 8]

5. Calculate the product:

4×8=32
Maximum product: 32




# Problem -----------------------------------------------------------------
46.Reverse every consecutive m elements of the given subarray
Given an array, reverse every group of consecutive m elements in a given subarray of it.

For example,

Consider the below array. A[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },m = 3 Then for subarray [i, j], where i and j is  Input:  i = 1, j = 7 or 8Output: [1, 4, 3, 2, 7, 6, 5, 8, 9, 10]  Input:  i = 1, j = 9Output: [1, 4, 3, 2, 7, 6, 5, 10, 9, 8]  Input:  i = 3, j = 5Output: [1, 2, 3, 6, 5, 4, 7, 8, 9, 10]  Input:  i = 3, j = 4Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Solution =============================================
def reverse_in_groups(arr, m, i, j)
  # Step 1: Extract the part of the array from index i to index j
  subarray = arr[i..j]  # this creates a new array with elements from i to j

  # Step 2: Reverse each group of m elements in the subarray
  # each_slice(m) splits the subarray into groups of m elements
  # map { |group| group.reverse } reverses each group
  # flatten joins all the groups back into one array
  subarray = subarray.each_slice(m).map { |group| group.reverse }.flatten

  # Step 3: Replace the original part of the array with the modified subarray
  arr[i..j] = subarray  # this updates the original array with our modified subarray

  # Return the modified array so we can see the result
  arr
end

# Test examples
arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts reverse_in_groups(arr1.clone, 3, 1, 7).inspect  # Output: [1, 4, 3, 2, 7, 6, 5, 8, 9, 10]

arr2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts reverse_in_groups(arr2.clone, 3, 1, 9).inspect  # Output: [1, 4, 3, 2, 7, 6, 5, 10, 9, 8]

arr3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts reverse_in_groups(arr3.clone, 3, 3, 5).inspect  # Output: [1, 2, 3, 6, 5, 4, 7, 8, 9, 10]

arr4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts reverse_in_groups(arr4.clone, 3, 3, 4).inspect  # Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



# Comment -----------------------------------------------------------------
To solve this problem, we’ll use Ruby and work in three main steps:

Isolate the subarray defined by indices i and j.
Divide this subarray into groups of m elements and reverse each group.
Insert the modified subarray back into the original array.

Explanation
Extract the Subarray: We use arr[i..j] to get the part of the array we want to manipulate, based on the provided indices i and j.
Reverse Groups of m: Using each_slice(m), we split the subarray into chunks of m elements. We then reverse each chunk with map { |group| group.reverse } and flatten it back into a single array.
Replace the Range in Original Array: We update the specified range in the original array with our modified subarray.
This approach efficiently handles the problem and can be tested with various values for i, j, and m.

# Math -----------------------------------------------------------------

Example 1
Input:

##Ruby##
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
m = 3
i = 1
j = 7
##Ruby##
Steps:

Extract the Subarray from Index i to j:

arr[1..7] gives us the elements from index 1 to 7: [2, 3, 4, 5, 6, 7, 8].
Split the Subarray into Groups of m Elements and Reverse Each Group:

Splitting [2, 3, 4, 5, 6, 7, 8] into groups of 3 gives:
Group 1: [2, 3, 4]
Group 2: [5, 6, 7]
Group 3: [8]
Reversing each group:
Reversed Group 1: [4, 3, 2]
Reversed Group 2: [7, 6, 5]
Reversed Group 3 (remains the same as it has fewer than m elements): [8]
Flattening these reversed groups gives the modified subarray: [4, 3, 2, 7, 6, 5, 8].
Replace the Original Elements in the Range with the Modified Subarray:

Replace arr[1..7] with [4, 3, 2, 7, 6, 5, 8] in the original array:
The resulting array is: [1, 4, 3, 2, 7, 6, 5, 8, 9, 10].
Output: [1, 4, 3, 2, 7, 6, 5, 8, 9, 10]

Example 2
Input:

##Ruby##
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
m = 3
i = 1
j = 9
##Ruby##
Steps:

Extract the Subarray from Index i to j:

arr[1..9] gives us [2, 3, 4, 5, 6, 7, 8, 9, 10].
Split the Subarray into Groups of m Elements and Reverse Each Group:

Splitting [2, 3, 4, 5, 6, 7, 8, 9, 10] into groups of 3:
Group 1: [2, 3, 4]
Group 2: [5, 6, 7]
Group 3: [8, 9, 10]
Reversing each group:
Reversed Group 1: [4, 3, 2]
Reversed Group 2: [7, 6, 5]
Reversed Group 3: [10, 9, 8]
Flattening these reversed groups gives the modified subarray: [4, 3, 2, 7, 6, 5, 10, 9, 8].
Replace the Original Elements in the Range with the Modified Subarray:

Replace arr[1..9] with [4, 3, 2, 7, 6, 5, 10, 9, 8] in the original array:
The resulting array is: [1, 4, 3, 2, 7, 6, 5, 10, 9, 8].
Output: [1, 4, 3, 2, 7, 6, 5, 10, 9, 8]

Example 3
Input:

##Ruby##
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
m = 3
i = 3
j = 5
##Ruby##
Steps:

Extract the Subarray from Index i to j:

arr[3..5] gives us [4, 5, 6].
Split the Subarray into Groups of m Elements and Reverse Each Group:

Since we have only one group [4, 5, 6] (size is exactly m):
Reversing it gives [6, 5, 4].
Replace the Original Elements in the Range with the Modified Subarray:

Replace arr[3..5] with [6, 5, 4] in the original array:
The resulting array is: [1, 2, 3, 6, 5, 4, 7, 8, 9, 10].
Output: [1, 2, 3, 6, 5, 4, 7, 8, 9, 10]

Example 4
Input:

##Ruby##
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
m = 3
i = 3
j = 4
##Ruby##
Steps:

Extract the Subarray from Index i to j:

arr[3..4] gives us [4, 5].
Split the Subarray into Groups of m Elements and Reverse Each Group:

Here, the subarray [4, 5] is shorter than m, so it remains unchanged.
Replace the Original Elements in the Range with the Modified Subarray:

The range remains the same, so the array stays [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Problem -----------------------------------------------------------------
# 45.Rearrange array such that `A[A[i]]` is set to `i` for every element `A[i]`
# Given an unsorted integer array A of size n, whose elements lie in the range 0 to n-1, rearrange the array such that A[A[i]] is set to i for every array element A[i]. Do this in linear time and without using any extra constant space.

# For example,

# Input:  {1, 3, 4, 2, 0}Output: {4, 0, 3, 1, 2} Explanation: A[0] = 1, A[1] becomes 0A[1] = 3, A[3] becomes 1A[2] = 4, A[4] becomes 2A[3] = 2, A[2] becomes 3A[4] = 0, A[0] becomes 4

# Solution =============================================

# Function to rearrange elements of the array as per the given condition
def rearrange(arr)
  n = arr.length

  # Step 1: Modify each element to contain both old and new values.
  # We do this by adding the new value (target index) multiplied by n to each element
  # This encodes two pieces of information in each cell without using extra space.
  (0...n).each do |i|
    # Here, (arr[arr[i]] % n) gives us the new value for arr[i]
    arr[i] = arr[i] + (arr[arr[i]] % n) * n
  end

  # Step 2: Divide each element by n to get the final rearranged values
  # as each element now holds both the old and new values encoded in it.
  (0...n).each do |i|
    arr[i] /= n
  end
end

# Example usage:
arr = [1, 3, 4, 2, 0]
rearrange(arr)
puts arr.inspect # Output should be [4, 0, 3, 1, 2]

# Math -----------------------------------------------------------------

Given the input array:

##RUBY##
arr = [1, 3, 4, 2, 0]
##RUBY##

# Step 1: Encode each element with both old and new values

In this step, we iterate through each element in the array and update each element as: arr[i] = arr[i] + ( arr[arr[i]]%𝑛)×𝑛 where n is the length of the array (in this case, 𝑛 = 5 ).

Original array: [1, 3, 4, 2, 0]

1. For i = 0:

arr[0] is 1.
We calculate arr[arr[0]] % n → arr[1] % 5 → 3 % 5 = 3.
Update arr[0] to arr[0] + (arr[arr[0]] % n) * n:
  𝑎𝑟𝑟[0]=1+(3×5)=1+15=16

Array after step: [16, 3, 4, 2, 0]

2. For i = 1:

arr[1] is 3.
Calculate arr[arr[1]] % n → arr[3] % 5 → 2 % 5 = 2.
Update arr[1] to arr[1] + (arr[arr[1]] % n) * n:
  arr[1]=3+(2×5)=3+10=13
Array after step: [16, 13, 4, 2, 0]

3. For i = 2:

arr[2] is 4.
Calculate arr[arr[2]] % n → arr[4] % 5 → 0 % 5 = 0.
Update arr[2] to arr[2] + (arr[arr[2]] % n) * n:
  arr[2]=4+(0×5)=4+0=4
Array after step: [16, 13, 4, 2, 0] (no change)

4.For i = 3:

arr[3] is 2.
Calculate arr[arr[3]] % n → arr[2] % 5 → 4 % 5 = 4.
Update arr[3] to arr[3] + (arr[arr[3]] % n) * n:
  arr[3]=2+(4×5)=2+20=22
Array after step: [16, 13, 4, 22, 0]

5. For i = 4:

arr[4] is 0.
Calculate arr[arr[4]] % n → arr[0] % 5 → 16 % 5 = 1.
Update arr[4] to arr[4] + (arr[arr[4]] % n) * n:
  arr[4]=0+(1×5)=0+5=5
Array after step: [16, 13, 4, 22, 5]

After encoding, the array looks like this:

##RUBY##
  [16, 13, 4, 22, 5]
##RUBY##

# Step 2: Decode the new values by dividing each element by n

Now, to get the final rearranged values, we divide each element by n (5) to retrieve the new values.

1. For i = 0:
  arr[0]=16/5=3

2. For i = 1:
  arr[1]=13/5=2

3. For i = 2:
  arr[2]=4/5=0

4. For i = 3:
  arr[3]=22/5=4

5. For i = 4:
  arr[4]=5/5=1

Final array after rearrangement: [4, 0, 3, 1, 2]

This matches the expected output. Each position in the array now satisfies the condition A[A[i]]=i.

# Comment -----------------------------------------------------------------

# Approach:
# 1. We'll use each element's value as a temporary marker to store the new position.
# 2. For each element in the array, we will perform a cyclic swap based on the problem's requirements.

# Explanation:
# 1. Encoding the New Values:

# We loop through each element and store the new value at each index using a combination of the current and target positions.
# We calculate arr[arr[i]] % n to get the target index without altering the current value.
# Then we add (arr[arr[i]] % n) * n to the current value at arr[i], effectively encoding the old and new values.

# 2. Extracting the New Values:

# After encoding all values, we divide each element by n to isolate the new values, achieving the desired arrangement.
# This method rearranges the array in linear time O(n) and constant space O(1), meeting the problem requirements.

# Problem -----------------------------------------------------------------
44.Find the longest continuous sequence length with the same sum in given binary arrays
Given two binary arrays, X and Y, find the length of the longest continuous sequence that starts and ends at the same index in both arrays and have the same sum. In other words, find max(j-i+1) for every j >= i, where the sum of subarray X[i, j] is equal to the sum of subarray Y[i, j].

For example, consider the following binary arrays X and Y:

X[]: {0, 0, 1, 1, 1, 1}Y[]: {0, 1, 1, 0, 1, 0}

 The length of the longest continuous sequence with the same sum is 5 as

X[0, 4]: {0, 0, 1, 1, 1} (sum = 3)Y[0, 4]: {0, 1, 1, 0, 1} (sum = 3)



# Solution =============================================

def longest_equal_sum_sequence(x, y)
  # Initialize variables
  max_length = 0  # To keep track of the longest length found
  diff_map = {}   # To store first occurrences of cumulative differences
  diff_map[0] = -1  # Edge case when the cumulative difference is 0
  cumulative_diff = 0 # Tracks cumulative difference between sums of X and Y arrays

  # Iterate through each index
  (0...x.length).each do |i|
    # Update the cumulative difference between X and Y
    cumulative_diff += x[i] - y[i]
    
    # Check if this difference has been seen before
    if diff_map.key?(cumulative_diff)
      # Calculate the length of the subarray with equal sums
      length = i - diff_map[cumulative_diff]
      max_length = [max_length, length].max  # Update max_length if longer subarray found
    else
      # Store the first occurrence of this cumulative difference
      diff_map[cumulative_diff] = i
    end
  end

  max_length  # Return the longest length found
end

# Test the function with the example arrays
x = [0, 0, 1, 1, 1, 1]
y = [0, 1, 1, 0, 1, 0]
puts longest_equal_sum_sequence(x, y)  # Expected output: 5


# Comment -----------------------------------------------------------------
# Solution Strategy:
# 1. Calculate the difference in cumulative sums between X and Y as we iterate through each element.
# 2. Use a hash map (diff_map) to store the first occurrence of each cumulative difference.
# 3. For each index j, if the cumulative difference has been seen before (i.e., it exists in the diff_map), it means that the subarrays from the first occurrence up to j have equal sums.
# 4. Calculate the length of this subarray and update the maximum length if it's the longest found so far.

# Explanation of Code:

# Line by Line:

# max_length is initialized to keep track of the longest subarray found with equal sums in 
# X and Y.

# diff_map is a hash map that stores the first occurrence of each cumulative difference.
# cumulative_diff is the running difference between the sums of X and Y up to each index.

# Key Logic:

# For each index i, we calculate the cumulative difference between X and Y.

# If cumulative_diff has been seen before, it means there exists a subarray (from that first occurrence up to i) where the sums are equal in both arrays.

# The length of this subarray is calculated and compared with max_length to find the longest.
# Output:

# This code will output 5 for the given example arrays, which is the length of the longest continuous sequence with the same sum.

# Problem -----------------------------------------------------------------

43.Find Triplet with given sum in an array
Given an unsorted integer array, find a triplet with a given sum in it.

For example,

Input: nums = [ 2, 7, 4, 0, 9, 5, 1, 3 ]target = 6 Output: Triplet exists. The triplets with the given sum 6 are {0, 1, 5}, {0, 2, 4}, {1, 2, 3}


# Solution =============================================

# Function to find all triplets in an array that sum up to a given target
def find_triplets(nums, target)
  # Sort the array to simplify the process of finding triplets
  nums.sort!

  # Create an empty array to store the triplets
  triplets = []

  # Iterate through the array
  (0..nums.length - 3).each do |i|
    # Use two pointers to check for triplets
    left = i + 1
    right = nums.length - 1

    while left < right
      # Calculate the sum of the current triplet
      current_sum = nums[i] + nums[left] + nums[right]

      # Check if the sum matches the target
      if current_sum == target
        # Add the found triplet to the result array
        triplets << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
      elsif current_sum < target
        # If the current sum is less than the target, move the left pointer to the right
        left += 1
      else
        # If the current sum is greater than the target, move the right pointer to the left
        right -= 1
      end
    end
  end

  # Return the list of triplets
  triplets
end

# Example usage
nums = [2, 7, 4, 0, 9, 5, 1, 3]
target = 6

result = find_triplets(nums, target)

# Check if any triplets were found
if result.empty?
  puts "No triplet exists."
else
  puts "Triplet exists. The triplets with the given sum #{target} are:"
  result.each { |triplet| puts "#{triplet}" }
end


# Comment -----------------------------------------------------------------

Explanation:

1. Sorting: We first sort the array to use the two-pointer technique efficiently.

2. Two pointers: For each number in the array, we use two pointers (one starting from the next element and one from the end of the array) to find pairs that together with the current number sum up to the target.

3. If condition: If the sum of the current triplet equals the target, we add it to the result. If the sum is less than the target, we move the left pointer to the right to increase the sum; otherwise, we move the right pointer to the left to decrease the sum.

4. Return: Finally, we return all found triplets.

This approach has a time complexity of 𝑂(𝑛2) because we are using two pointers for each element. Let me know if you have any questions!

# Problem -----------------------------------------------------------------

42.Sort an array using one swap
Given an array where all its elements are sorted in increasing order except two swapped elements, sort it in linear time. Assume there are no duplicates in the array.

For example,

Input:  A[] = [3, 8, 6, 7, 5, 9] or [3, 5, 6, 9, 8, 7] or [3, 5, 7, 6, 8, 9] Output: A[] = [3, 5, 6, 7, 8, 9]

# Solution =============================================
def fix_swapped_elements(arr)
  n = arr.length
  
  # Initialize two variables to store the indexes of the swapped elements
  x = -1
  y = -1
  
  # Find the first and second swapped elements
  (0...(n-1)).each do |i|
    if arr[i] > arr[i + 1]
      if x == -1
        x = i   # First swapped element
      else
        y = i + 1   # Second swapped element
      end
    end
  end
  
  # If second swapped element wasn't found in the loop, it's adjacent to the first
  y = x + 1 if y == -1
  
  # Swap the two elements to correct the array
  arr[x], arr[y] = arr[y], arr[x]
  
  # Return the sorted array
  arr
end

# Example usage:
arr1 = [3, 8, 6, 7, 5, 9]
arr2 = [3, 5, 6, 9, 8, 7]
arr3 = [3, 5, 7, 6, 8, 9]

puts "Sorted array: #{fix_swapped_elements(arr1)}"
puts "Sorted array: #{fix_swapped_elements(arr2)}"
puts "Sorted array: #{fix_swapped_elements(arr3)}"



# Comment -----------------------------------------------------------------

# Explanation:
# Step 1: We loop through the array and find the two places where the sorting order is violated (i.e., when arr[i] > arr[i + 1]). These are the indices of the two swapped elements.
# Step 2: Once we identify the two swapped elements, we swap them back to their correct positions.
# Step 3: Return the corrected (sorted) array.
# Example Output:
 
  Sorted array: [3, 5, 6, 7, 8, 9]
  Sorted array: [3, 5, 6, 7, 8, 9]
  Sorted array: [3, 5, 6, 7, 8, 9]
  
# This approach ensures linear time complexity 𝑂(𝑛), since we only loop through the array once to find the swapped elements and perform a single swap.


# Problem -----------------------------------------------------------------

41. Decode an array constructed from another array
Given an array constructed from another array A by taking the sum of every distinct pair in it, decode it to get the original array A back.

If the original array is A[0], A[1], … , A[n-1], then the input array is

{  (A[0] + A[1]), (A[0] + A[2]), … (A[0] + A[n-1]),  (A[1] + A[2]), (A[1] + A[3]), … (A[1] + A[n-1]),  …  …  (A[i] + A[i+1]), (A[i] + A[i+2]), … (A[i] + A[n-1]),  …  …  (A[n-2] + A[n-1])}

# Solution =============================================

def decode_array(sum_pairs)
  # Sort the sum pairs to ensure we start with the smallest sums
  sum_pairs.sort!

  # Step 1: Extract the first three elements from sorted sum_pairs
  sum_a0_a1 = sum_pairs[0]
  sum_a0_a2 = sum_pairs[1]
  sum_a1_a2 = sum_pairs[2]

  # Step 2: Calculate A[0], A[1], and A[2]
  sum_a0_a1_a2 = (sum_a0_a1 + sum_a0_a2 + sum_a1_a2) / 2

  a0 = sum_a0_a1_a2 - sum_a1_a2  # A[0]
  a1 = sum_a0_a1_a2 - sum_a0_a2  # A[1]
  a2 = sum_a0_a1_a2 - sum_a0_a1  # A[2]

  # Step 3: Now that we have A[0], A[1], and A[2], let's calculate the rest of A
  # The length of the original array can be deduced from the number of sum pairs
  n = (-1 + Math.sqrt(1 + 8 * sum_pairs.length)) / 2  # Solves for n in the quadratic formula n(n-1)/2 = len(sum_pairs)

  original_array = [a0, a1, a2]

  # Step 4: Use remaining sum pairs to calculate other elements
  index = 3
  while original_array.length < n
    # Each new element is paired with previous elements, so we can use the sorted sums
    next_sum = sum_pairs[index]
    new_element = next_sum - a0  # Subtract A[0] (first element) to get the next element
    original_array << new_element
    index += 1
  end

  original_array
end

# Example usage:
sum_pairs = [11, 12, 13, 14, 15, 16]
original_array = decode_array(sum_pairs)
puts "Decoded array: #{original_array}"


# Comment -----------------------------------------------------------------

# Explanation:
# Sorting: We sort the sum_pairs to get the smallest pairs first.
# Sum Calculation: The sum of the three smallest elements gives us the total sum of A[0] + A[1] + A[2]. Using this, we can extract the individual values of A[0], A[1], and A[2].
# Array Length: The number of sum pairs is derived from the equation for combinations: n(n-1)/2, which helps calculate n.
# Decoding the Rest: After calculating the first three elements, we proceed to decode the remaining elements based on the pair sums.



# Problem -----------------------------------------------------------------
# 40.Find minimum platforms needed in the station so to avoid any delay in arrival of any train
# Find minimum platforms needed to avoid delay in the train arrival
# Given a schedule containing the arrival and departure time of trains in a station, find the minimum number of platforms needed to avoid delay in any train’s arrival.

# For example,

# Trains arrival   = { 2.00, 2.10, 3.00, 3.20, 3.50, 5.00 }Trains departure = { 2.30, 3.40, 3.20, 4.30, 4.00, 5.20 } The minimum platforms needed is 2  The train arrived at 2.00 on platform 1The train arrived at 2.10 on platform 2The train departed at 2.30 from platform 1The train arrived at 3.00 on platform 1The train departed at 3.20 from platform 1The train arrived at 3.20 on platform 1The train departed at 3.40 from platform 2The train arrived at 3.50 on platform 2The train departed at 4.00 from platform 2The train departed at 4.30 from platform 1The train arrived at 5.00 on platform 1The train departed at 5.20 from platform 1

# Solution =============================================

def find_minimum_platforms(arrivals, departures)
  # Sort both arrivals and departures times
  arrivals.sort!
  departures.sort!

  # Initialize pointers and counters
  platform_needed = 1  # We need at least one platform for the first train
  result = 1           # Store the maximum platforms needed
  i = 1                # Pointer for arrivals
  j = 0                # Pointer for departures
  n = arrivals.length  # Total number of trains

  # Loop through the arrival and departure times
  while i < n && j < n
    # If the next train arrives before the last one departs, we need a new platform
    if arrivals[i] <= departures[j]
      platform_needed += 1
      i += 1
    # Otherwise, we can free up a platform
    else
      platform_needed -= 1
      j += 1
    end

    # Update the result to hold the maximum platforms needed
    result = [result, platform_needed].max
  end

  # Return the result, which is the maximum number of platforms needed
  result
end

# Example usage:
arrivals = [2.00, 2.10, 3.00, 3.20, 3.50, 5.00]
departures = [2.30, 3.40, 3.20, 4.30, 4.00, 5.20]

puts "Minimum platforms needed: #{find_minimum_platforms(arrivals, departures)}"


# Comment -----------------------------------------------------------------
# Explanation:
# Sorting: First, we sort the arrival and departure times.
# Two-pointer technique: We use two pointers, one for arrivals and one for departures. This helps us keep track of when a platform becomes available.
# Count platforms: Every time a train arrives and there's no platform free, we increase the count of platforms needed. When a train departs, we decrease the count of platforms.
# Track the maximum: We keep track of the maximum platforms used at any point in time.
# Example Walkthrough:
# Given the arrivals [2.00, 2.10, 3.00, 3.20, 3.50, 5.00] and departures [2.30, 3.40, 3.20, 4.30, 4.00, 5.20], the minimum platforms needed is 2. The trains overlap at certain points, so 2 platforms are required to avoid delays.

# This algorithm runs in 𝑂(𝑛log 𝑛) due to the sorting, where 𝑛 is the number of trains.



# Problem -----------------------------------------------------------------

# 39.Find maximum sum of subsequence with no adjacent elements
# Find the maximum sum of a subsequence with no adjacent elements
# Given an integer array, find the maximum sum of subsequence where the subsequence contains no element at adjacent positions.

# Please note that the problem specifically targets subsequences that need not be contiguous, i.e., subsequences are not required to occupy consecutive positions within the original sequences.

#  For example,

# Input:  { 1, 2, 9, 4, 5, 0, 4, 11, 6 }Output: The maximum sum is 26 The maximum sum is formed by subsequence { 1, 9, 5, 11 }

# Solution =============================================

def max_sum_subsequence(arr)
  # Edge cases
  return 0 if arr.empty?         # If the array is empty, the sum is 0
  return arr[0] if arr.length == 1  # If there is only one element, return that element
  
  n = arr.length
  dp = Array.new(n, 0) # Create a dp array of size n initialized to 0

  # Base cases
  dp[0] = arr[0]  # The first element is the maximum sum for just one element
  dp[1] = [arr[0], arr[1]].max  # The max sum for the first two elements is the greater of them
  
  # Fill the dp array using the recurrence relation
  (2...n).each do |i|
    dp[i] = [dp[i-1], dp[i-2] + arr[i]].max  # Max of excluding or including the current element
  end
  
  # The last element of dp contains the result
  return dp[n-1]
end

# Example usage
arr = [1, 2, 9, 4, 5, 0, 4, 11, 6]
puts "The maximum sum is #{max_sum_subsequence(arr)}"

# Sample Example Calculated Solution:
# For the input array:
# arr = [1, 2, 9, 4, 5, 0, 4, 11, 6]
# The maximum sum is 26, formed by the subsequence [1, 9, 5, 11].


# Comment -----------------------------------------------------------------

# step-by-step explanation of the approach:

# Base Cases:

# If the array has no elements, the maximum sum is 0.
# If the array has one element, the maximum sum is that single element.
# Recurrence Relation:

# For each element at index i, we have two choices:
# Include the current element: If we include the current element, we must exclude the previous one (i.e., sum up the value of the current element with the best solution up to i-2).
# Exclude the current element: If we exclude the current element, the best solution is the same as the one at i-1.
# Therefore, the recurrence relation becomes:

# 𝑑𝑝[𝑖] = max(𝑑𝑝[𝑖−1],𝑑𝑝[𝑖−2]+𝑎𝑟𝑟[𝑖])
# dp[i]=max(dp[i−1],dp[i−2]+arr[i])

# Final Answer: The value at the last index (dp[n-1]) will give the maximum sum we can achieve without picking adjacent elements.

# Explanation:
# We handle edge cases: If the array is empty or has just one element.
# We initialize a dp array where dp[i] holds the maximum sum up to index i.
# We then iterate over the array, filling up the dp array using the recurrence relation.
# Finally, the last value of dp contains the maximum sum of a subsequence with no adjacent elements.

# Problem -----------------------------------------------------------------
38.Find maximum product subarray in a given array
Given an integer array, find the subarray that has the maximum product of its elements. The solution should return the maximum product of elements among all possible subarrays.

For example,

Input:  { -6, 4, -5, 8, -10, 0, 8 }Output: 1600Explanation: The maximum product subarray is {4, -5, 8, -10} having product 1600  Input:  { 40, 0, -20, -10 }Output: 200Explanation: The maximum product subarray is {-20, -10} having product 200

# Solution =============================================

# Function to find the maximum product subarray
def max_product_subarray(arr)
  # Edge case: If the array is empty, return 0
  return 0 if arr.empty?
  
  # Initialize the current maximum, current minimum, and global maximum with the first element
  current_max = arr[0]
  current_min = arr[0]
  global_max = arr[0]
  
  # Iterate through the array, starting from the second element
  (1...arr.length).each do |i|
    # Store the current number for easier reference
    num = arr[i]
    
    # Since a negative number can flip the product, calculate possible maximums and minimums
    temp_max = [num, current_max * num, current_min * num].max
    current_min = [num, current_max * num, current_min * num].min
    
    # Update the current maximum to the newly calculated max (using temp variable)
    current_max = temp_max
    
    # Update the global maximum if the current maximum is greater than the global one
    global_max = [global_max, current_max].max
  end
  
  # Return the global maximum, which holds the maximum product of any subarray
  global_max
end

# Test with the given examples
arr1 = [-6, 4, -5, 8, -10, 0, 8]
arr2 = [40, 0, -20, -10]

puts "Max product of subarray in arr1: #{max_product_subarray(arr1)}"  # Output: 1600
puts "Max product of subarray in arr2: #{max_product_subarray(arr2)}"  # Output: 200


# Comment -----------------------------------------------------------------


# 1. Initial Setup:

# We first check if the array is empty. If it is, we return 0 since there are no elements.
# We then initialize three important variables:
# current_max: The maximum product at the current position.
# current_min: The minimum product at the current position (used for handling negative numbers).
# global_max: This keeps track of the maximum product found so far.

# 2. Iteration:

# We loop through each element of the array starting from the second element.
# For each number, we calculate:
# The possible new current_max (maximum product) by considering the current number, the product of the current number and the previous current_max, and the product of the current number and the previous current_min.
# The new current_min is similarly calculated to handle the case where multiplying by a negative number might flip a minimum product into a maximum one.
# We update the global_max to be the largest value between the current maximum and the previously known global_max.

# 3. Final Result:

# After iterating through the array, global_max will hold the maximum product of any subarray, which is then returned.

# Example Walkthrough:

# For the input [-6, 4, -5, 8, -10, 0, 8]:

# At index 1, the current max becomes 4.
# At index 2, multiplying -5 with the previous max and min gives a new max of 30.
# Continuing this logic, the subarray [4, -5, 8, -10] will produce the maximum product, which is 1600.
# For the input [40, 0, -20, -10]:

# The subarray [-20, -10] gives the maximum product of 200.


# Problem -----------------------------------------------------------------

37.Longest Decreasing Subsequence Problem
The longest decreasing subsequence problem is to find a subsequence of a given sequence in which the subsequence’s elements are in sorted order, highest to lowest, and in which the subsequence is as long as possible. This subsequence is not necessarily contiguous or unique.

Please note that the problem specifically targets subsequences that need not be contiguous, i.e., subsequences are not required to occupy consecutive positions within the original sequences.

For example, consider the following subsequence:

[0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]

 The longest decreasing subsequence is [12, 10, 9, 5, 3], which has length 5; the input sequence has no 6–member decreasing subsequences.

 The longest decreasing subsequence in this example is not unique: for instance, [12, 10, 6, 5, 3] is another decreasing subsequence of equal length in the same input sequence.

# Solution =============================================

def longest_decreasing_subsequence(arr)
  n = arr.length
  dp = Array.new(n, 1)  # dp array initialized to 1, since each element is a subsequence of length 1

  # Outer loop: Start from the second element and go till the end of the array
  (1...n).each do |i|
    # Inner loop: Compare current element arr[i] with each previous element arr[j]
    (0...i).each do |j|
      # If the current element arr[i] is less than arr[j], it can form a decreasing subsequence
      # Also, we check if adding arr[i] makes a longer subsequence than the current dp[i] value
      if arr[i] < arr[j] && dp[i] < dp[j] + 1
        dp[i] = dp[j] + 1  # Update dp[i] with the new longer subsequence length
      end
    end
  end

  # The rest of the code finds the maximum length and reconstructs the subsequence
  max_length = dp.max
  lds = []
  i = n - 1
  while i >= 0
    if dp[i] == max_length
      lds.unshift(arr[i])
      max_length -= 1
    end
    i -= 1
  end

  return lds
end

# Example usage:
sequence = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
result = longest_decreasing_subsequence(sequence)
puts "The longest decreasing subsequence is: #{result}"


# Comment -----------------------------------------------------------------

# Initialization:

# We create a dp array where each element starts as 1, because every individual element can be considered a subsequence of length 1.
# Building the dp Array:

# We loop through each element i of the array.
# For each i, we loop through all elements before it (j) to see if they can form a longer decreasing subsequence. If arr[i] < arr[j], it means i can extend the subsequence ending at j.
# Finding the Maximum Length:

# We find the maximum value in the dp array, which represents the length of the longest decreasing subsequence.
# Reconstructing the Subsequence:

# We then reconstruct the subsequence by backtracking through the array, starting from the end. We add elements to the result if they match the max_length and decrement the max_length as we go.

# Outer Loop (1...n).each do |i|:

#   This loop iterates over each element in the array starting from the second element (index 1) to the last element (index n-1).
#   The reason we start from 1 is because the first element (index 0) doesn’t need to compare with any elements before it since it's the first element.
#   Inner Loop (0...i).each do |j|:
  
#   For each element i, this inner loop iterates over all the previous elements (from index 0 to i-1).
#   The purpose of this loop is to check each previous element j to see if it can form a longer decreasing subsequence when combined with the current element i.

# Problem -----------------------------------------------------------------

36.Longest Increasing Subsequence
The Longest Increasing Subsequence (LIS) problem is to find a subsequence of a given sequence in which the subsequence’s elements are in sorted order, lowest to highest, and in which the subsequence is as long as possible. This subsequence is not necessarily contiguous or unique.

For example, consider the following subsequence:

{0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15}

 The longest increasing subsequence is {0, 2, 6, 9, 11, 15} having length 6; the input sequence has no 7–member increasing subsequences. The longest increasing subsequence in this example is not unique. For instance, {0, 4, 6, 9, 11, 15} and {0, 4, 6, 9, 13, 15} are other increasing subsequences of equal length in the same input sequence.

# Solution =============================================

def longest_increasing_subsequence(arr)
  n = arr.length  # Length of the input array

  # Step 1: Initialize DP array where each element starts as 1
  dp = Array.new(n, 1)  # Creates an array of size n, all initialized to 1

  # Step 2: Fill DP array by comparing each element with previous elements
  for i in 1...n  # Start from the second element (index 1) to the last element
    for j in 0...i  # Compare with all previous elements (from index 0 to i-1)
      if arr[i] > arr[j]  # Check if the current element is greater than the previous element
        dp[i] = [dp[i], dp[j] + 1].max  # Update dp[i] to the maximum value between current dp[i] and dp[j] + 1
      end
    end
  end

  # Step 3: Find and return the maximum value in the DP array
  dp.max  # The length of the longest increasing subsequence
end

# Example usage
arr = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
puts longest_increasing_subsequence(arr)  # Output will be 6


# Comment -----------------------------------------------------------------

# Initialization:

# We start by creating a dp array with the same length as the input array. Each element of dp is set to 1 because the smallest subsequence that ends at any element is the element itself.

dp = Array.new(n, 1)

# Filling the DP Array:

# We loop through each element in the array starting from the second one. For each element arr[i], we compare it with all previous elements arr[j] (where j goes from 0 to i-1).
# If arr[i] > arr[j], it means arr[i] can be added to the subsequence ending at arr[j]. We then update dp[i] to be the maximum of its current value and dp[j] + 1.

for i in 1...n
  for j in 0...i
    if arr[i] > arr[j]
      dp[i] = [dp[i], dp[j] + 1].max
    end
  end
end

# Finding the Maximum Value:

# The length of the longest increasing subsequence will be the maximum value found in the dp array.

dp.max

# Example Walkthrough
# For the input array:


arr = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]

# 1. Initialization: dp starts as:


dp = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

# 2. Filling the DP Array: As we compare each element with the previous ones and update dp, it gradually becomes:


dp = [1, 2, 2, 3, 2, 3, 4, 5, 2, 4, 4, 5, 3, 6, 5, 6]

# 3. Finding the Maximum: The maximum value in dp is 6, which means the length of the longest increasing subsequence is 6.


# Problem -----------------------------------------------------------------

35.Trapping Rain Water within given set of bars
Trapping rainwater problem: Find the maximum amount of water that can be trapped within a given set of bars where each bar’s width is 1 unit.

For example,

 Input: An array containing height of bars {7, 0, 4, 2, 5, 0, 6, 4, 0, 5}

# Solution =============================================

def trap_rainwater(heights)
  # Step 1: Get the number of bars (the length of the array)
  n = heights.size
  
  # Step 2: If there are no bars or only one bar, no water can be trapped
  if n == 0
    return 0
  end
  
  # Step 3: Initialize pointers to start and end of the array
  left = 0         # Start pointer at the first bar
  right = n - 1    # End pointer at the last bar
  
  # Step 4: Initialize variables to store the maximum height seen so far from both ends
  left_max = 0     # Maximum height encountered from the left side
  right_max = 0    # Maximum height encountered from the right side
  
  # Step 5: Initialize a variable to accumulate the total trapped water
  water_trapped = 0
  
  # Step 6: Use a loop to go through the array from both ends
  # The loop continues until the left pointer meets or crosses the right pointer
  while left <= right
    # Step 7: Compare the heights at the left and right pointers
    if heights[left] <= heights[right]
      # Step 8: If the current bar on the left is shorter or equal to the one on the right
      
      # Check if the current left bar is the highest seen so far from the left
      if heights[left] >= left_max
        # Update left_max if this bar is the tallest so far from the left
        left_max = heights[left]
      else
        # Calculate the water trapped above this bar
        # Water trapped here is the difference between left_max and the height of the current bar
        water_trapped += left_max - heights[left]
      end
      
      # Move the left pointer to the right to process the next bar
      left += 1
    else
      # Step 9: If the current bar on the right is shorter than the one on the left
      
      # Check if the current right bar is the highest seen so far from the right
      if heights[right] >= right_max
        # Update right_max if this bar is the tallest so far from the right
        right_max = heights[right]
      else
        # Calculate the water trapped above this bar
        # Water trapped here is the difference between right_max and the height of the current bar
        water_trapped += right_max - heights[right]
      end
      
      # Move the right pointer to the left to process the next bar
      right -= 1
    end
  end
  
  # Step 10: Return the total amount of water trapped
  return water_trapped
end

# Example usage:
# Let's use the array {7, 0, 4, 2, 5, 0, 6, 4, 0, 5} as an example to find out the total water trapped.
heights = [7, 0, 4, 2, 5, 0, 6, 4, 0, 5]

# Call the function and print the result
puts trap_rainwater(heights)  # Output should be the total water trapped


# Comment -----------------------------------------------------------------

# Detailed Explanation:

# Step 1: Determine the Array Size

# We first determine the number of bars by getting the length of the array.
# Step 2: Handle Edge Cases

# If there are no bars or just one bar, we know there can't be any trapped water, so we return 0.
# Step 3: Initialize Pointers

# We use two pointers: left starts at the beginning of the array, and right starts at the end of the array.
# Step 4: Track Maximum Heights

# left_max keeps track of the tallest bar we've seen from the left side as we move through the array.
# right_max does the same for the right side.
# Step 5: Initialize Water Storage

# water_trapped will accumulate the total amount of water trapped.
# Step 6: Loop Through the Array

# The loop runs as long as the left pointer hasn't crossed the right pointer.
# Steps 7-8: Process the Left Side

# If the bar on the left is shorter or equal to the bar on the right:
# We check if this bar is the tallest we've seen so far from the left.
# If it is, update left_max.
# If it isn't, calculate the water trapped above this bar as the difference between left_max and the current bar's height.
# Move the left pointer to the right.
# Steps 9: Process the Right Side

# If the bar on the right is shorter:
# We do the same checks and calculations as we did for the left, but from the right side.
# Move the right pointer to the left.
# Step 10: Return the Result

# After the loop completes, we return the total amount of water trapped.
# Output:
# When you run the code with the example array {7, 0, 4, 2, 5, 0, 6, 4, 0, 5}, it will output the total amount of trapped water, which is the result of adding up all the trapped water calculated in the loop.

# Problem -----------------------------------------------------------------

# 34.Maximum profit earned by buying and selling shares any number of times
# Given a list containing future prediction of share prices, find the maximum profit earned by buying and selling shares any number of times with the constraint, a new transaction can only start after the previous transaction is complete, i.e., we can only hold at most one share at a time.

# For example,

# Stock Prices: {1, 5, 2, 3, 7, 6, 4, 5} Total profit earned is 10 Buy on day 1 and sell on day 2Buy on day 3 and sell on day 5Buy on day 7 and sell on day 8  Stock Prices: {10, 8, 6, 5, 4, 2} Total profit earned is 0

# Calculations:

# Step-by-Step Calculation:
# Initial Setup:

# left = 0, right = 9 (indices of the first and last bars)
# left_max = 0, right_max = 0 (initial maximums)
# water_trapped = 0 (initial water amount)
# Iteration 1:

# heights[left] = 7, heights[right] = 5
# Since heights[left] > heights[right], process the right side:
# right_max = max(0, 5) = 5
# No water is trapped here because heights[right] = right_max
# Move right pointer to 8.
# Iteration 2:

# heights[left] = 7, heights[right] = 0
# Since heights[left] > heights[right], process the right side:
# right_max = max(5, 0) = 5
# Water trapped = right_max - heights[right] = 5 - 0 = 5
# Add to water_trapped, now water_trapped = 5
# Move right pointer to 7.
# Iteration 3:

# heights[left] = 7, heights[right] = 4
# Since heights[left] > heights[right], process the right side:
# right_max = max(5, 4) = 5
# Water trapped = right_max - heights[right] = 5 - 4 = 1
# Add to water_trapped, now water_trapped = 6
# Move right pointer to 6.
# Iteration 4:

# heights[left] = 7, heights[right] = 6
# Since heights[left] > heights[right], process the right side:
# right_max = max(5, 6) = 6
# No water is trapped because heights[right] = right_max
# Move right pointer to 5.
# Iteration 5:

# heights[left] = 7, heights[right] = 0
# Since heights[left] > heights[right], process the right side:
# right_max = max(6, 0) = 6
# Water trapped = right_max - heights[right] = 6 - 0 = 6
# Add to water_trapped, now water_trapped = 12
# Move right pointer to 4.
# Iteration 6:

# heights[left] = 7, heights[right] = 5
# Since heights[left] > heights[right], process the right side:
# right_max = max(6, 5) = 6
# Water trapped = right_max - heights[right] = 6 - 5 = 1
# Add to water_trapped, now water_trapped = 13
# Move right pointer to 3.
# Iteration 7:

# heights[left] = 7, heights[right] = 2
# Since heights[left] > heights[right], process the right side:
# right_max = max(6, 2) = 6
# Water trapped = right_max - heights[right] = 6 - 2 = 4
# Add to water_trapped, now water_trapped = 17
# Move right pointer to 2.
# Iteration 8:

# heights[left] = 7, heights[right] = 4
# Since heights[left] > heights[right], process the right side:
# right_max = max(6, 4) = 6
# Water trapped = right_max - heights[right] = 6 - 4 = 2
# Add to water_trapped, now water_trapped = 19
# Move right pointer to 1.
# Iteration 9:

# heights[left] = 7, heights[right] = 0
# Since heights[left] > heights[right], process the right side:
# right_max = max(6, 0) = 6
# Water trapped = right_max - heights[right] = 6 - 0 = 6
# Add to water_trapped, now water_trapped = 25
# Move right pointer to 0.
# Final State:

# Both pointers are now at the same position, and the loop ends.
# Total water trapped = 25 units.

# Calculation solution links: https://www.techiedelight.com/trapping-rain-water-within-given-set-bars/

# Solution =============================================

def max_profit(prices)
  # Initialize a variable to keep track of the total profit.
  total_profit = 0

  # Loop through each price in the list, starting from the second day (index 1).
  # We use the range (1...prices.length) to ensure we don't go out of bounds.
  (1...prices.length).each do |i|
    # On each iteration, we're looking at the current day's price (prices[i])
    # and comparing it with the previous day's price (prices[i - 1]).

    # Check if the price today is greater than the price yesterday.
    if prices[i] > prices[i - 1]
      # If today's price is higher, that means we could have bought the stock
      # yesterday and sold it today for a profit.
      
      # Calculate the profit made by selling today after buying yesterday.
      profit = prices[i] - prices[i - 1]
      
      # Add this profit to our total profit.
      total_profit += profit
    end

    # If today's price is not higher than yesterday's, we do nothing.
    # We don't buy the stock if we can't make a profit.
  end

  # After checking all days, return the total profit.
  return total_profit
end

# Let's test this code with two examples:

# Example 1: Stock prices go up and down
prices1 = [1, 5, 2, 3, 7, 6, 4, 5]
# Expected output: 10 (profit from buying and selling multiple times)

# Example 2: Stock prices only go down
prices2 = [10, 8, 6, 5, 4, 2]
# Expected output: 0 (no profit to be made)

# Print the results for both examples
puts "Total profit for prices1: #{max_profit(prices1)}"  # Output: 10
puts "Total profit for prices2: #{max_profit(prices2)}"  # Output: 0



# Comment -----------------------------------------------------------------

# 1.Initialization:

#     total_profit = 0

#   We start with a total_profit of 0 because we haven't made any transactions yet.

# 2.Loop through the prices:

#     (1...prices.length).each do |i|

#   We use a loop to go through each day’s price, starting from the second day (index 1).
#   We compare each day’s price with the previous day’s price.

# 3.Check for profit opportunity:

#     if prices[i] > prices[i - 1]

#   We check if the price today (prices[i]) is higher than the price yesterday (prices[i - 1]).
#   If it is, it means we could have bought the stock yesterday and sold it today for a profit.

# 4.Calculate and add the profit:

#     profit = prices[i] - prices[i - 1]
#     total_profit += profit

#   We calculate the profit by subtracting yesterday’s price from today’s price.
#   Then, we add this profit to our total_profit.

# 5.No action on loss or no gain:

#   If today’s price isn’t higher than yesterday’s, the if condition fails, and we skip adding anything to total_profit.

# 6. Return the total profit:

#     return total_profit

#   After going through all the days, the function returns the total_profit, which is the maximum profit we could have made.

# Example Walkthrough

#   Example 1: [1, 5, 2, 3, 7, 6, 4, 5]
#   Day 1 to Day 2: Price goes from 1 to 5, profit = 4.
#   Day 3 to Day 5: Price goes from 2 to 7, profit = 5.
#   Day 7 to Day 8: Price goes from 4 to 5, profit = 1.
#   Total profit = 4 + 5 + 1 = 10.
  
#   Example 2: [10, 8, 6, 5, 4, 2]

#   Prices keep going down, so there’s no opportunity to make a profit.
#   Total profit = 0.


# Problem -----------------------------------------------------------------

33.Find maximum sum path involving elements of given arrays
Given two sorted arrays of integers, find a maximum sum path involving elements of both arrays whose sum is maximum. We can start from either array, but we can switch between arrays only through its common elements.

For example,

Input: X = { 3, 6, 7, 8, 10, 12, 15, 18, 100 }Y = { 1, 2, 3, 5, 7, 9, 10, 11, 15, 16, 18, 25, 50 }  The maximum sum path is: 1 —> 2 —> 3 —> 6 —> 7 —> 9 —> 10 —> 12 —> 15 —> 16 —> 18 —> 100 The maximum sum is 199

# Solution =============================================

# Function to find the maximum sum path
def max_sum_path(X, Y)
  m = X.length
  n = Y.length
  
  # Initialize sums for paths
  sum1 = 0 # sum of elements in X
  sum2 = 0 # sum of elements in Y
  
  # Initialize pointers for both arrays
  i = 0
  j = 0
  
  # Initialize result to store the maximum sum path
  result = 0
  
  # Traverse both arrays
  while i < m && j < n
    if X[i] < Y[j]
      sum1 += X[i]
      i += 1
    elsif X[i] > Y[j]
      sum2 += Y[j]
      j += 1
    else # X[i] == Y[j]
      # Common element found, add the maximum sum so far and reset sums
      result += [sum1, sum2].max + X[i]
      sum1 = 0
      sum2 = 0
      i += 1
      j += 1
  end
  
  # Add remaining elements of X
  while i < m
    sum1 += X[i]
    i += 1
  end
  
  # Add remaining elements of Y
  while j < n
    sum2 += Y[j]
    j += 1
  end
  
  # Add the maximum of remaining sums
  result += [sum1, sum2].max
  
  return result
end

# Example usage
X = [3, 6, 7, 8, 10, 12, 15, 18, 100]
Y = [1, 2, 3, 5, 7, 9, 10, 11, 15, 16, 18, 25, 50]

puts "The maximum sum path is: #{max_sum_path(X, Y)}"


# Comment -----------------------------------------------------------------

Initialize Sums and Pointers: We start with two pointers i and j for arrays X and Y, respectively. We also initialize two sums, sum1 for the elements in X and sum2 for the elements in Y.

Traverse Both Arrays: We traverse both arrays simultaneously using the pointers. At each step, we compare the elements at X[i] and Y[j]:

If X[i] is smaller, add X[i] to sum1 and increment i.
If Y[j] is smaller, add Y[j] to sum2 and increment j.
If X[i] is equal to Y[j], we have found a common element. We add the maximum of sum1 and sum2 to the result, reset sum1 and sum2, and then add the common element to the result. Increment both pointers.
Add Remaining Elements: After the main loop, we may have remaining elements in one of the arrays. We add these remaining elements to their respective sums.

Final Maximum Sum: Finally, we add the maximum of the remaining sums to the result and return it.

This approach ensures that we take the maximum sum path involving elements from both arrays, switching between arrays only at common elements.

# Problem -----------------------------------------------------------------

32.Find the smallest window in array sorting which will make the entire array sorted

Given an integer array, find the smallest window sorting which will make the entire array sorted in increasing order.

For example,

Input:  { 1, 2, 3, 7, 5, 6, 4, 8 }Output: Sort the array from index 3 to 6  Input:  { 1, 3, 2, 7, 5, 6, 4, 8 }Output: Sort the array from index 1 to 6


# Solution =============================================

def find_smallest_window(arr)
  n = arr.length

  # Step 1: Find the start of the window
  start = 0
  while start < n - 1 && arr[start] <= arr[start + 1]
    start += 1
  end

  # If the array is already sorted
  if start == n - 1
    return "The array is already sorted"
  end

  # Step 2: Find the end of the window
  end_idx = n - 1
  while end_idx > 0 && arr[end_idx] >= arr[end_idx - 1]
    end_idx -= 1
  end

  # Find the min and max of the identified subarray
  subarray_min = arr[start..end_idx].min
  subarray_max = arr[start..end_idx].max

  # Step 3: Extend the subarray to include any number which is out of order
  while start > 0 && arr[start - 1] > subarray_min
    start -= 1
  end

  while end_idx < n - 1 && arr[end_idx + 1] < subarray_max
    end_idx += 1
  end

  # Output the result
  "Sort the array from index #{start} to #{end_idx}"
end

# Test cases
arr1 = [1, 2, 3, 7, 5, 6, 4, 8]
arr2 = [1, 3, 2, 7, 5, 6, 4, 8]

puts find_smallest_window(arr1) # Output: "Sort the array from index 3 to 6"
puts find_smallest_window(arr2) # Output: "Sort the array from index 1 to 6"


# Comment -----------------------------------------------------------------

This code follows these steps:

It identifies the part of the array that is not sorted.
It finds the minimum and maximum values within this unsorted part.
It expands the start and end indices to include any numbers outside this range that need to be sorted as well.
Finally, it returns the indices that need to be sorted to make the entire array sorted.


# Problem -----------------------------------------------------------------

31.Find largest number possible from set of given numbers
Find the largest number possible from a set of given numbers where the numbers append to each other in any order to form the largest number.

For example,

Input:  { 10, 68, 75, 7, 21, 12 } Output: 77568211210
# Solution =============================================

def largest_number(arr)
  # Convert numbers to strings
  arr = arr.map(&:to_s)

  # Bubble sort with custom comparison
  n = arr.length
  loop do
    swapped = false

    (n-1).times do |i|
      if (arr[i] + arr[i + 1]) < (arr[i + 1] + arr[i])
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end

    break unless swapped
  end

  # Concatenate the sorted strings
  result = arr.join

  # If the result is all zeros, return "0"
  result.sub!(/^0+/, '0')

  result
end

# Example usage
input_numbers = [10, 68, 75, 7, 21, 12]
result = largest_number(input_numbers)
puts result  # Output: 77568211210



# Comment -----------------------------------------------------------------

1. Convert Numbers to Strings:

In Ruby, numbers need to be converted to strings so that we can concatenate them and compare the concatenated results.
arr.map(&:to_s) converts each number in the array to a string.
&:to_s is a shorthand for arr.map { |num| num.to_s }.

2. Sorting the Numbers with Custom Comparison:

We need a way to sort the numbers such that when concatenated, they form the largest possible number.
To achieve this, we compare concatenated results of two numbers in different orders.
For example, to decide the order between 68 and 7, we compare 687 (68 followed by 7) and 768 (7 followed by 68). Since 768 is larger, 7 should come before 68.

3.Bubble Sort with Custom Comparison:

Bubble sort is a straightforward sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The process is repeated until the list is sorted.
Here’s how bubble sort works with our custom comparison:
# Problem -----------------------------------------------------------------

30.Find the length of smallest subarray whose sum of elements is greater than the given number
Given an array of positive integers, find the smallest subarray’s length whose sum of elements is greater than a given number k.

For example,

Input:  {1, 2, 3, 4, 5, 6, 7, 8}, k = 20Output: The smallest subarray length is 3Explanation: The smallest subarray with sum > 20 is {6, 7, 8}  Input:  {1, 2, 3, 4, 5, 6, 7, 8}, k = 7Output: The smallest subarray length is 1Explanation: The smallest subarray with sum > 7 is {8}  Input:  {1, 2, 3, 4, 5, 6, 7, 8}, k = 21Output: The smallest subarray length is 4Explanation: The smallest subarray with sum > 21 is {4, 5, 6, 7}  Input:  {1, 2, 3, 4, 5, 6, 7, 8}, k = 40Output: No subarray exists

# Solution =============================================

def smallest_subarray_length(arr, k)
  # Initialize variables
  n = arr.length
  min_length = n + 1
  current_sum = 0
  start_index = 0

  # Iterate over the array
  for end_index in 0...n
    # Add the current element to the current sum
    current_sum += arr[end_index]

    # Shrink the window as long as the current sum is greater than k
    while current_sum > k
      # Update the minimum length if the current subarray is smaller
      min_length = [min_length, end_index - start_index + 1].min

      # Subtract the element at start_index and move start_index forward
      current_sum -= arr[start_index]
      start_index += 1
    end
  end

  # Check if we found a valid subarray
  if min_length == n + 1
    return "No subarray exists"
  else
    return "The smallest subarray length is #{min_length}"
  end
end

# Test the function with given examples
puts smallest_subarray_length([1, 2, 3, 4, 5, 6, 7, 8], 20)  # Output: The smallest subarray length is 3
puts smallest_subarray_length([1, 2, 3, 4, 5, 6, 7, 8], 7)   # Output: The smallest subarray length is 1
puts smallest_subarray_length([1, 2, 3, 4, 5, 6, 7, 8], 21)  # Output: The smallest subarray length is 4
puts smallest_subarray_length([1, 2, 3, 4, 5, 6, 7, 8], 40)  # Output: No subarray exists



# Comment -----------------------------------------------------------------

Initialization:

n is the length of the array.
min_length is set to n + 1 as an initial value greater than any possible subarray length.
current_sum keeps track of the sum of the current window.
start_index marks the start of the current subarray.
Sliding Window:

The outer loop (for end_index in 0...n) expands the window by including the next element in current_sum.
The inner while loop checks if current_sum is greater than k and tries to shrink the window from the left to find the smallest possible subarray with sum greater than k.
Result:

If min_length was updated, it prints the smallest subarray length.
If no valid subarray was found, it returns "No subarray exists".
This approach ensures that we traverse each element of the array at most twice, resulting in an efficient solution with a time complexity of 𝑂(𝑛).

# Problem -----------------------------------------------------------------

29.Find subarray having given sum in given array of integers
Given an integer array, find a subarray having a given sum in it.

For example,

Input:  nums[] = {2, 6, 0, 9, 7, 3, 1, 4, 1, 10}, target = 15Output: {6, 0, 9}  Input:  nums[] = {0, 5, -7, 1, -4, 7, 6, 1, 4, 1, 10}, target = 15Output: {1, -4, 7, 6, 1, 4} or {4, 1, 10}  Input:  nums[] = {0, 5, -7, 1, -4, 7, 6, 1, 4, 1, 10}, target = -3Output: {1, -4} or {-7, 1, -4, 7}


# Solution =============================================

# Method to find subarray with a given sum
def find_subarray_with_sum(nums, target)
  # Initialize a hash to store cumulative sums
  sum_map = {}
  # Initialize sum and start index
  sum = 0
  start_index = 0
  
  # Traverse the array
  nums.each_with_index do |num, end_index|
    sum += num
    
    # Check if current sum is equal to target
    if sum == target
      return nums[start_index..end_index]
    end

    # Check if (sum - target) exists in hash map
    if sum_map.key?(sum - target)
      start_index = sum_map[sum - target] + 1
      return nums[start_index..end_index]
    end
    
    # Store current sum in hash map
    sum_map[sum] = end_index
  end
  
  # If no subarray found, return an empty array
  return []
end

# Test cases
nums1 = [2, 6, 0, 9, 7, 3, 1, 4, 1, 10]
target1 = 15
puts "Input: nums = #{nums1}, target = #{target1}"
puts "Output: #{find_subarray_with_sum(nums1, target1)}"

nums2 = [0, 5, -7, 1, -4, 7, 6, 1, 4, 1, 10]
target2 = 15
puts "Input: nums = #{nums2}, target = #{target2}"
puts "Output: #{find_subarray_with_sum(nums2, target2)}"

target3 = -3
puts "Input: nums = #{nums2}, target = #{target3}"
puts "Output: #{find_subarray_with_sum(nums2, target3)}"


# Comment -----------------------------------------------------------------

1. sum_map: A hash map that stores the cumulative sum as keys and their corresponding index as values.
2. sum: Variable to keep the cumulative sum of elements as you traverse the array.
3. start_index: Keeps track of the starting index of the subarray.
4. Traversal: As you traverse the array, add each element to the cumulative sum.
5. Check: For each element, check if the cumulative sum equals the target. If yes, return the subarray from start to current index.
6. Hash Map Check: If the difference between the cumulative sum and the target exists in the hash map, it means there is a subarray summing to the target. Calculate the starting index of this subarray and return it.
7. Store Sum: Store the cumulative sum in the hash map with its index.
This approach efficiently finds the subarray with a given sum in linear time, 𝑂(𝑛), where 
𝑛 is the number of elements in the array.

OTHER METHODS:

1. Brute Force Approach
Pros:

Simple to Implement: This method is straightforward and easy to understand.
Works for All Arrays: Handles both positive and negative numbers without additional logic.
Cons:

Inefficient for Large Arrays: Time complexity is 𝑂(𝑛^2), making it slow for large arrays.
No Optimization: Does not leverage any optimizations or data structures to improve performance.
2. Sliding Window Technique (For Non-Negative Numbers)
Pros:
Efficient for Non-Negative Numbers: Time complexity is 𝑂(𝑛), making it very efficient for arrays with only non-negative numbers.
Simple Logic: The sliding window is an intuitive approach for continuous subarrays.
Cons:
Limited Use Case: Only works with non-negative numbers. Does not handle arrays with negative numbers correctly.
Not General Purpose: Requires modifications to work with all types of integer arrays.
3. Using Prefix Sum Array
Pros:

Handles All Arrays: Works with both positive and negative numbers.
Better than Brute Force: Somewhat optimized compared to brute force, though still 𝑂(𝑛^2).
Cons:
Inefficient: Time complexity is still 𝑂(𝑛^2), which can be slow for large arrays.
Additional Space: Requires additional space for the prefix sum array.
4. Modified Kadane’s Algorithm
Pros:

Efficient: Time complexity is 𝑂(𝑛), making it very efficient for large arrays.
Handles All Arrays: Works with both positive and negative numbers.
Simple Hash Map: Uses a hash map for quick lookups of cumulative sums.
Cons:

Extra Space: Requires additional space for the hash map.
Complexity: Slightly more complex to implement compared to brute force or sliding window.
5. Divide and Conquer
Pros:

Divide and Conquer Paradigm: Can be more intuitive for those familiar with this algorithm design strategy.
Handles All Arrays: Works with both positive and negative numbers.
Cons:

Complex Implementation: More complex to implement compared to other approaches.
Inefficient: Time complexity is 𝑂(𝑛log𝑛), which is slower than the 𝑂(𝑛) approaches.
Comparison to Hash Map Approach
Hash Map Approach (Provided Initially):

Pros:

Efficient: Time complexity is 𝑂(𝑛), making it very efficient for large arrays.
Handles All Arrays: Works with both positive and negative numbers.
Simple Logic: Using a hash map for cumulative sums simplifies the logic and makes the implementation straightforward.
Cons:

Extra Space: Requires additional space for the hash map.
Hash Map Overhead: The overhead of maintaining a hash map may be a slight disadvantage in terms of memory usage.
Summary
1. Brute Force: Simple but inefficient for large arrays.
2. Sliding Window: Efficient for non-negative numbers but limited in scope.
3. Prefix Sum Array: Works for all arrays but inefficient and requires extra space.
4. Modified Kadane’s Algorithm: Efficient and works for all arrays, similar to the hash map approach but with a different implementation.
5. Divide and Conquer: Conceptually interesting but more complex and less efficient than linear approaches.

The hash map approach strikes a good balance between simplicity, efficiency, and general applicability, making it a robust choice for this problem.



# Problem -----------------------------------------------------------------

28.Find minimum sum subarray of given size k

Given an integer array, find the minimum sum subarray of size k, where k is a positive integer.

For example,

Input:  {10, 4, 2, 5, 6, 3, 8, 1}, k = 3 Output: Minimum sum subarray of size 3 is (1, 3)

# Solution =============================================

def min_sum_subarray(arr, k)
  n = arr.length

  # Check if the array length is less than k
  if n < k
    puts "Invalid input: Array size is smaller than subarray size"
    return
  end

  # Compute the sum of the first window of size k
  min_sum = arr[0...k].sum
  current_sum = min_sum
  min_start_index = 0

  # Slide the window over the array
  (k...n).each do |i|
    current_sum = current_sum - arr[i - k] + arr[i]

    # Update minimum sum and starting index if a new minimum is found
    if current_sum < min_sum
      min_sum = current_sum
      min_start_index = i - k + 1
    end
  end

  # Print the result
  puts "Minimum sum subarray of size #{k} is #{arr[min_start_index...min_start_index + k]}, with sum #{min_sum}"
end

# Example usage
arr = [10, 4, 2, 5, 6, 3, 8, 1]
k = 3
min_sum_subarray(arr, k)


# Comment -----------------------------------------------------------------

Initial Check: Ensure the array size is not smaller than 𝑘

First Window Sum: Calculate the sum of the first 𝑘 elements.
Sliding the Window: For each element from 𝑘 to the end of the array, update the current sum by removing the element that's sliding out and adding the new element that's sliding in.
Track Minimum: If the current sum is less than the minimum sum recorded, update the minimum sum and the starting index of the minimum sum subarray.
Result: Print the subarray with the minimum sum and the sum.
This approach ensures we find the minimum sum subarray of size 𝑘 efficiently.

# Problem -----------------------------------------------------------------

27.Find maximum sequence of continuous 1’s formed by replacing at-most k zeroes by ones

Given a binary array, find the maximum sequence of continuous 1’s that can be formed by replacing at most k zeros by ones.

For example, consider the following binary array A:

Input: A[] = { 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0 }  For k = 0,The length of the longest sequence is 4 (from index 6 to 9) For k = 1,The length of the longest sequence is 7 (from index 3 to 9) For k = 2,The length of the longest sequence is 10 (from index 0 to 9) For k = 3,The length of the longest sequence is 11 (from index 0 to 10)

# Solution =============================================

def find_max_sequence_of_ones(arr, k)
  # Initialize the left pointer of the window
  left = 0

  # This will store the maximum length of the window that we find
  max_len = 0

  # This will keep track of the number of zeros in the current window
  zero_count = 0

  # Iterate through the array with the right pointer
  arr.each_with_index do |val, right|
    # If the current element is zero, increment the zero_count
    if val == 0
      zero_count += 1
    end

    # If the number of zeros in the current window exceeds k,
    # move the left pointer to the right to reduce the zero count
    while zero_count > k
      # If the element at the left pointer is zero, decrement the zero_count
      if arr[left] == 0
        zero_count -= 1
      end
      # Move the left pointer to the right
      left += 1
    end

    # Calculate the length of the current window and update max_len if it's larger
    current_window_length = right - left + 1
    if current_window_length > max_len
      max_len = current_window_length
    end
  end

  # Return the maximum length of the window found
  max_len
end

# Example usage of the function
arr = [1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0]

# Different values of k to test
k_values = [0, 1, 2, 3]

# For each value of k, find and print the length of the longest sequence of 1's
k_values.each do |k|
  longest_sequence = find_max_sequence_of_ones(arr, k)
  puts "For k = #{k}, the length of the longest sequence is #{longest_sequence}"
end


# Comment -----------------------------------------------------------------

Initialization:

left is initialized to 0, representing the starting index of the sliding window.
max_len is initialized to 0, which will store the maximum length of the window that satisfies the condition.
zero_count is initialized to 0, to count the number of zeros in the current window.
Iterating through the Array:

The each_with_index method is used to iterate through the array with right representing the current index.
If the current element val is zero, zero_count is incremented.
Adjusting the Window:

If zero_count exceeds k, the while loop shifts the left pointer to the right until zero_count is less than or equal to k.
If the element at the left pointer is zero, zero_count is decremented.
The left pointer is then incremented.
Updating Maximum Length:

The length of the current window is calculated as right - left + 1.
If this length is greater than max_len, update max_len.
Output:

For each value of k in k_values, the function find_max_sequence_of_ones is called, and the result is printed.
This method ensures that the algorithm is efficient and runs in O(n) time complexity, where n is the length of the array.

# Problem -----------------------------------------------------------------

26.Find all distinct combinations of given length with repetition allowed

Given an integer array, find all distinct combinations of a given length k, where the repetition of elements is allowed.

For example,

Input:  {1, 2, 3}, k = 2Output: {1, 1}, {1, 2}, {1, 3}, {2, 2}, {2, 3}, {3, 3}  Input:  {1, 2, 3, 4}, k = 2Output: {1, 1}, {1, 2}, {1, 3}, {1, 4}, {2, 2}, {2, 3}, {2, 4}, {3, 3}, {3, 4}, {4, 4}  Input:  {1, 2, 1}, k = 2Output: {1, 1}, {1, 2}, {2, 2}
# Solution =============================================

def find_combinations(arr, k)
  arr = arr.uniq.sort  # Remove duplicates and sort the array
  result = []
  combination = []

  # Helper function to generate combinations
  def generate_combinations(arr, combination, start, k, result)
    if combination.length == k
      result << combination.dup
      return
    end

    (start...arr.length).each do |i|
      combination.push(arr[i])
      generate_combinations(arr, combination, i, k, result)
      combination.pop
    end
  end

  generate_combinations(arr, combination, 0, k, result)
  result
end

# Example usage:
arr1 = [1, 2, 3]
k1 = 2
puts "Input: #{arr1}, k = #{k1}"
puts "Output: #{find_combinations(arr1, k1).inspect}"

arr2 = [1, 2, 3, 4]
k2 = 2
puts "Input: #{arr2}, k = #{k2}"
puts "Output: #{find_combinations(arr2, k2).inspect}"

arr3 = [1, 2, 1]
k3 = 2
puts "Input: #{arr3}, k = #{k3}"
puts "Output: #{find_combinations(arr3, k3).inspect}"


# Comment -----------------------------------------------------------------

# Remove Duplicates and Sort the Array:

# arr = arr.uniq.sort ensures that we only work with unique elements and in sorted order.
# Helper Function generate_combinations:

# This function uses recursion to generate combinations.
# It starts from a given index and adds elements to the combination until its length is k.
# Base Case:

# When the length of combination equals k, it is added to the result.
# Recursive Case:

# Loop through the elements starting from the start index.
# Add the current element to the combination and recurse with the updated combination.
# Remove the last element added to backtrack and try the next element.
# Generate and Print Combinations:

# The main function initializes the result array and calls the helper function.
# The combinations are printed for each example input.


# Problem -----------------------------------------------------------------

25.Find all distinct combinations of given length

Given an integer array, find all distinct combinations of a given length k.

For example,

Input:  {2, 3, 4}, k = 2Output: {2, 3}, {2, 4}, {3, 4}  Input:  {1, 2, 1}, k = 2Output: {1, 2}, {1, 1}, {2, 1}
The program should print all the distinct combinations, while preserving the relative order of elements as they appear in the array.

# Solution =============================================

# Main function to find and print all distinct combinations of length k
def find_combinations(arr, k)
  result = []  # Initialize an array to store the resulting combinations
  
  # Call the helper function with initial parameters
  combination_helper(arr, k, 0, [], result)
  
  # Remove duplicates from the result and print each combination
  result.uniq.each do |comb|
    p comb
  end
end

# Helper function to recursively build combinations
def combination_helper(arr, k, start, current_comb, result)
  # Check if the current combination length is equal to k
  if current_comb.length == k
    # Add a copy of the current combination to the result array
    result << current_comb.dup
    return  # Return to stop further processing in this recursive path
  end

  # Iterate over the array starting from the current start index to the end
  (start...arr.length).each do |i|
    # Add the current element to the current combination
    current_comb.push(arr[i])
    
    # Recursively call the helper function to build the next combination
    combination_helper(arr, k, i + 1, current_comb, result)
    
    # Remove the last element from the current combination to backtrack
    current_comb.pop
  end
end

# Example usage
arr1 = [2, 3, 4]
k1 = 2
# Call the main function with the first example input
find_combinations(arr1, k1)
# Expected Output: [2, 3], [2, 4], [3, 4]

arr2 = [1, 2, 1]
k2 = 2
# Call the main function with the second example input
find_combinations(arr2, k2)
# Expected Output: [1, 2], [1, 1], [2, 1]


# Comment -----------------------------------------------------------------

# Detailed Explanation:
# Main Function (find_combinations):

# Initialize result Array:
# result is an empty array that will store all the combinations found.
# Call Helper Function:
# combination_helper is called with initial parameters:
# arr: The input array.
# k: The desired combination length.
# 0: The starting index for the combination.
# []: An empty array to build the current combination.
# result: The array that will store all combinations.
# Remove Duplicates and Print:
# After the helper function populates result, uniq is used to remove duplicate combinations.
# Each unique combination is printed using p.
# Helper Function (combination_helper):

# Base Case:
# If current_comb.length equals k, a copy of current_comb is added to result.
# dup is used to add a copy, ensuring current_comb can be modified in further recursive calls.
# The function returns to stop further processing in this recursive path.
# Iteration and Recursion:
# A loop iterates over the array from start to the end.
# For each element at index i:
# The element is added to current_comb.
# The helper function is called recursively to continue building the combination.
# i + 1 ensures that the next element starts from the subsequent index, preserving order.
# After the recursive call, the last element is removed (pop) to backtrack and explore other combinations.
# Example Usage:

# arr1 and k1 are provided as inputs to find_combinations.
# The function call prints all unique combinations of length k from arr1.
# Similarly, arr2 and k2 demonstrate another example.
# This detailed form ensures clarity on how each part of the code works, making it easier to understand and modify if necessary.

# Problem -----------------------------------------------------------------

24.Maximum Sum Circular Subarray
Maximum Sum Circular Subarray
Given a circular integer array, find a subarray with the largest sum in it.

For example,

Input:  {2, 1, -5, 4, -3, 1, -3, 4, -1} Output: Subarray with the largest sum is {4, -1, 2, 1} with sum 6.  Input:  {-3, 1, -3, 4, -1, 2, 1, -5, 4} Output: Subarray with the largest sum is {4, -1, 2, 1} with sum 6.

# Solution =============================================

# Function to find the maximum sum subarray using Kadane's algorithm
def kadane(array)
  # Initialize max_ending_here and max_so_far with the first element
  max_ending_here = max_so_far = array[0]

  # Iterate through the array starting from the second element
  array[1..-1].each do |x|
    # Update max_ending_here to be either the current element or
    # the current element plus the previous max_ending_here
    max_ending_here = [x, max_ending_here + x].max

    # Update max_so_far to be the maximum of max_so_far and max_ending_here
    max_so_far = [max_so_far, max_ending_here].max
  end

  # Return the maximum subarray sum found
  max_so_far
end

# Function to find the minimum sum subarray using a modified Kadane's algorithm
def kadane_min(array)
  # Initialize min_ending_here and min_so_far with the first element
  min_ending_here = min_so_far = array[0]

  # Iterate through the array starting from the second element
  array[1..-1].each do |x|
    # Update min_ending_here to be either the current element or
    # the current element plus the previous min_ending_here
    min_ending_here = [x, min_ending_here + x].min

    # Update min_so_far to be the maximum of min_so_far and min_ending_here
    min_so_far = [min_so_far, min_ending_here].min
  end

  # Return the minimum subarray sum found
  min_so_far
end

# Function to find the maximum sum circular subarray
def max_sum_circular_subarray(array)
  # Find the maximum sum subarray using Kadane's algorithm
  max_kadane = kadane(array)

  # Calculate the total sum of the array
  total_sum = array.sum

  # Find the minimum sum subarray using the modified Kadane's algorithm
  min_kadane = kadane_min(array)

  # Handling the case when all elements are negative
  # In this case, total_sum == min_kadane, so return max_kadane
  return max_kadane if total_sum == min_kadane
  
  # Calculate the maximum of the normal maximum subarray sum and
  # the circular maximum subarray sum
  [max_kadane, total_sum - min_kadane].max
end

# Test cases
array1 = [2, 1, -5, 4, -3, 1, -3, 4, -1]
array2 = [-3, 1, -3, 4, -1, 2, 1, -5, 4]

# Output the results of the test cases
puts "Max sum circular subarray of #{array1} is: #{max_sum_circular_subarray(array1)}"
puts "Max sum circular subarray of #{array2} is: #{max_sum_circular_subarray(array2)}"


# Comment -----------------------------------------------------------------

Kadane's Algorithm:

Initializes max_ending_here and max_so_far with the first element of the array.
Iterates through the rest of the array, updating max_ending_here and max_so_far to track the maximum subarray sum.
Modified Kadane for Minimum Sum:

Similar to Kadane's algorithm but modified to track the minimum subarray sum.
Main Function:

Computes the maximum sum subarray (max_kadane).
Computes the total sum of the array.
Computes the minimum sum subarray (min_kadane).
Handles the edge case where all elements are negative.
Returns the maximum of max_kadane and the circular subarray sum (total_sum - min_kadane).
Test Cases:

Two example arrays are tested, and the results are printed.

# Problem -----------------------------------------------------------------

23.Print continuous subarray with maximum sum
Print continuous subarray with maximum sum
Given an integer array, find and print a contiguous subarray with the maximum sum in it.

For example,

Input:  {-2, 1, -3, 4, -1, 2, 1, -5, 4} Output: The contiguous subarray with the largest sum is {4, -1, 2, 1}  Input:  {8, -7, -3, 5, 6, -2, 3, -4, 2} Output: The contiguous subarray with the largest sum is {5, 6, -2, 3}

# Solution =============================================

def max_subarray_sum(arr)
  n = arr.length
  return [] if n == 0  # Return an empty array if the input array is empty

  # Initialize variables
  max_so_far = arr[0]  # This will store the maximum sum found so far
  max_ending_here = arr[0]  # This will store the maximum sum of the subarray that ends at the current position
  start = 0  # This will store the start index of the maximum subarray
  end_index = 0  # This will store the end index of the maximum subarray
  s = 0  # This is a temporary start index

  for i in 1...n
    # Update max_ending_here to be the maximum of the current element or the current element plus max_ending_here
    if arr[i] > max_ending_here + arr[i]
      max_ending_here = arr[i]
      s = i  # Update the temporary start index to the current position
    else
      max_ending_here += arr[i]
    end

    # Update max_so_far if max_ending_here is greater
    if max_so_far < max_ending_here
      max_so_far = max_ending_here
      start = s  # Update the start index to the temporary start index
      end_index = i  # Update the end index to the current position
    end
  end

  # Print the subarray with the largest sum
  puts "The contiguous subarray with the largest sum is #{arr[start..end_index]}"
end

# Example usage:
max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
max_subarray_sum([8, -7, -3, 5, 6, -2, 3, -4, 2])


# Comment -----------------------------------------------------------------

# Initialization:

# max_so_far: Keeps track of the maximum sum found so far.
# max_ending_here: Keeps track of the maximum sum of the subarray ending at the current position.
# start and end_index: Track the start and end indices of the maximum subarray found.
# s: Temporary variable to track the potential start index of the current subarray.
# Iteration through the array:

# For each element, decide whether to start a new subarray at the current element or to continue the existing subarray.
# Update the maximum sum of the subarray ending at the current position.
# If a new maximum sum is found, update max_so_far and the start and end indices.
# Output:

# Print the contiguous subarray that has the maximum sum.
# This code efficiently finds the subarray with the maximum sum using Kadane's Algorithm, which runs in linear time, O(n).

 Problem -----------------------------------------------------------------

22.Maximum subarray problem (Kadane’s algorithm)

Given an integer array, find a contiguous subarray within it that has the largest sum.

For example,

Input:  {-2, 1, -3, 4, -1, 2, 1, -5, 4} Output: Subarray with the largest sum is {4, -1, 2, 1} with sum 6.



# Solution =============================================

# Method to find the maximum sum of a contiguous subarray
def max_subarray_sum(arr)
  # Initialize variables to keep track of the current subarray sum and the maximum sum found so far
  max_so_far = arr[0]  # Start with the first element
  max_ending_here = arr[0]  # Start with the first element

  # Iterate over the array starting from the second element
  (1...arr.length).each do |i|
    # Update max_ending_here to either the current element itself
    # or the sum of max_ending_here and the current element
    max_ending_here = [arr[i], max_ending_here + arr[i]].max

    # Update max_so_far to the maximum value between max_so_far and max_ending_here
    max_so_far = [max_so_far, max_ending_here].max
  end

  # Return the maximum subarray sum found
  max_so_far
end

# Example usage
input = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
puts "Subarray with the largest sum has sum #{max_subarray_sum(input)}"


# Comment -----------------------------------------------------------------

# Initialization:

# max_so_far is initialized to the first element of the array. This keeps track of the maximum sum found so far.
# max_ending_here is also initialized to the first element. This keeps track of the maximum sum of the subarray ending at the current position.
# Iteration:

# Loop through the array starting from the second element (index 1).
# For each element, update max_ending_here to be the maximum of the current element itself or the sum of max_ending_here and the current element. This decides whether to start a new subarray at the current element or to continue with the existing subarray.
# Update max_so_far to be the maximum of max_so_far and max_ending_here. This ensures that max_so_far always holds the maximum sum encountered so far.

# Scope:

# max_so_far: Global scope, considers all subarrays seen so far.
# max_ending_here: Local scope, considers only the subarray that ends at the current element.

# Function:

# max_so_far: Tracks the highest sum of any subarray seen during the entire iteration process.
# max_ending_here: Tracks the highest sum of the subarray that ends specifically at the current index.
    

# Problem -----------------------------------------------------------------

21.Find maximum difference between two elements in the array by satisfying given constraints

Given an integer array, find the maximum difference between two elements in it such that the smaller element appears before the larger element.

For example,

Input:  { 2, 7, 9, 5, 1, 3, 5 } Output: The maximum difference is 7. The pair is (2, 9)



# Solution =============================================

def max_difference(arr)
  # Return 0 if array has less than 2 elements
  return 0 if arr.length < 2

  # Initialize min_element to the first element of the array
  min_element = arr[0]
  # Initialize max_diff to a very small number (negative infinity)
  max_diff = -Float::INFINITY

  # Loop through the array starting from the second element
  (1...arr.length).each do |i|
    # Update max_diff if the current difference is greater than max_diff
    max_diff = [max_diff, arr[i] - min_element].max
    # Update min_element if the current element is smaller
    min_element = [min_element, arr[i]].min
  end

  # Return the maximum difference found
  max_diff
end

# Example usage:
arr = [2, 7, 9, 5, 1, 3, 5]
puts "The maximum difference is #{max_difference(arr)}."


# Comment -----------------------------------------------------------------

Initialization:

min_element is set to the first element of the array.
max_diff is set to negative infinity to ensure any valid difference will be larger.
Loop through the array:

For each element from the second to the last, compute the difference between the current element and min_element.
Update max_diff if the computed difference is larger than the current max_diff.
Update min_element to be the smaller value between the current min_element and the current element.
Return the result:

The max_diff variable now holds the maximum difference where the smaller element appears before the larger element in the array.
This solution has a time complexity of O(n) where n is the number of elements in the array, making it efficient for large arrays.

# Problem -----------------------------------------------------------------
20.Find Longest Bitonic Subarray in an array
The Longest Bitonic Subarray (LBS) problem is to find a subarray of a given sequence in which the subarray’s elements are first sorted in increasing order, then in decreasing order, and the subarray is as long as possible. Strictly ascending or descending subarrays are also accepted.

For example,

Longest bitonic subarray of the sequence { 3, 5, 8, 4, 5, 9, 10, 8, 5, 3, 4 } is { 4, 5, 9, 10, 8, 5, 3 } For sequences sorted in increasing or decreasing order, the output is the same as the input sequence, i.e., [1, 2, 3, 4, 5] ——> [1, 2, 3, 4, 5][5, 4, 3, 2, 1] ——> [5, 4, 3, 2, 1]
# Solution =============================================

def longest_bitonic_subarray(arr)
  n = arr.length

  # Arrays to store lengths of increasing and decreasing subarrays
  inc_lengths = Array.new(n, 1)
  dec_lengths = Array.new(n, 1)

  # Find lengths of increasing subarrays ending at each index
  (1...n).each do |i|
    (0...i).each do |j|
      if arr[i] > arr[j] && inc_lengths[i] < inc_lengths[j] + 1
        inc_lengths[i] = inc_lengths[j] + 1
      end
    end
  end

  # Find lengths of decreasing subarrays starting at each index
  (n - 2).downto(0).each do |i|
    (n - 1).downto(i).each do |j|
      if arr[i] > arr[j] && dec_lengths[i] < dec_lengths[j] + 1
        dec_lengths[i] = dec_lengths[j] + 1
      end
    end
  end

  # Find the maximum length of bitonic subarray
  max_length = 0
  (0...n).each do |i|
    bitonic_length = inc_lengths[i] + dec_lengths[i] - 1
    max_length = [max_length, bitonic_length].max
  end

  max_length
end

# Example usage
sequence = [3, 5, 8, 4, 5, 9, 10, 8, 5, 3, 4]
puts "Length of the longest bitonic subarray: #{longest_bitonic_subarray(sequence)}"


# Comment -----------------------------------------------------------------
This implementation iterates through the array twice to find the lengths of increasing and decreasing subarrays. Then, it combines these lengths to find the maximum length of the bitonic subarray. Finally, it returns the maximum length.
  
# Problem -----------------------------------------------------------------

19.Replace each element of array with product of every other element without using / operator

Given an integer array, replace each element with the product of every other element without using the division operator.

For example,

Input:  { 1, 2, 3, 4, 5 }Output: { 120, 60, 40, 30, 24 }  Input:  { 5, 3, 4, 2, 6, 8 }Output: { 1152, 1920, 1440, 2880, 960, 720 }

# Solution =============================================

# Function to replace each element in an array with the product of every other element
def product_array(nums)
  # Get the number of elements in the array
  n = nums.size
  # Initialize the output array with 1s
  output = Array.new(n, 1)
  
  # Left product initialization
  left_product = 1
  # Loop through the array from left to right
  (0...n).each do |i|
    # Set the current index of output to the accumulated left_product
    output[i] = left_product
    # Update left_product to include the current element
    left_product *= nums[i]
  end
  
  # Right product initialization
  right_product = 1
  # Loop through the array from right to left
  (n-1).downto(0).each do |i|
    # Multiply the current index of output by the accumulated right_product
    output[i] *= right_product
    # Update right_product to include the current element
    right_product *= nums[i]
  end
  
  # Return the final transformed array
  output
end

# Example usage of the function with two input arrays
input1 = [1, 2, 3, 4, 5]
input2 = [5, 3, 4, 2, 6, 8]
# Output results for the first input array
puts "Output for first input: #{product_array(input1).inspect}"
# Output results for the second input array
puts "Output for second input: #{product_array(input2).inspect}"


# Comment -----------------------------------------------------------------

# Function Definition: This line defines a function product_array that accepts an array nums.
# Array Size: This line retrieves the size of the input array and stores it in n.
# Output Initialization: This line initializes an output array filled with the value 1, because any number multiplied by 1 remains unchanged. This is preparatory for the subsequent product calculations.
# Left Products Loop: The loop calculates the cumulative product of elements on the left of each index and stores it in the output array at the corresponding index.
# Right Products Loop: After computing left products, this loop multiplies each element in the output array by the cumulative product of elements on the right, thus completing the requirement to multiply by every other element.


# Problem -----------------------------------------------------------------

18. Move all zeros present in an array to the end
Given an integer array, move all zeros present in it to the end. The solution should maintain the relative order of items in the array and should not use constant space.

For example,

Input:  { 6, 0, 8, 2, 3, 0, 4, 0, 1 } Output: { 6, 8, 2, 3, 4, 1, 0, 0, 0 }

# Solution =============================================

def move_zeros(arr)
  place_index = 0 # This is where the next non-zero should go

  # Find non-zero elements and move them to the beginning of the array
  arr.each do |num|
    if num != 0
      arr[place_index] = num
      place_index += 1
    end
  end

  # Fill the rest of the array with zeros
  while place_index < arr.length
    arr[place_index] = 0
    place_index += 1
  end

  arr
end

# Example usage:
input_array = [6, 0, 8, 2, 3, 0, 4, 0, 1]
output_array = move_zeros(input_array)
puts output_array.inspect # => [6, 8, 2, 3, 4, 1, 0, 0, 0]


# Comment -----------------------------------------------------------------

We use .each to iterate through all elements.
We only move place_index when we place a non-zero value.
After placing all non-zero values, the remaining positions in the array are filled with zeros.
    
# Problem -----------------------------------------------------------------

17.Find majority element in an array (Boyer–Moore majority vote algorithm)

Given an integer array containing duplicates, return the majority element if present. A majority element appears more than n/2 times, where n is the array size.

For example, the majority element is 2 in array {2, 8, 7, 2, 2, 5, 2, 3, 1, 2, 2}.

# Solution =============================================

def find_majority_element(nums)
  # Initialize candidate and count
  candidate = nil
  count = 0
  
  # First pass to find a candidate
  nums.each do |num|
    if count == 0
      candidate = num
    end
    if num == candidate
      count += 1
    else
      count -= 1
    end
  end
  
  # Second pass to confirm the candidate (optional, only if the problem statement asks for confirmation)
  count = 0
  nums.each do |num|
    if num == candidate
      count += 1
    end
  end
  
  # Check if the candidate is actually the majority element
  count > nums.length / 2 ? candidate : nil
end

# Example usage
array = [2, 8, 7, 2, 2, 5, 2, 3, 1, 2, 2]
puts find_majority_element(array)



# Comment -----------------------------------------------------------------

         

# Problem -----------------------------------------------------------------
16.Find equilibrium index of an array

Given an integer array, find the equilibrium index in it.

For an array A consisting n elements, index i is an equilibrium index if the sum of elements of subarray A[0…i-1] is equal to the sum of elements of subarray A[i+1…n-1]. i.e.

(A[0] + A[1] + … + A[i-1]) = (A[i+1] + A[i+2] + … + A[n-1]), where 0 < i < n-1

Similarly, 0 is an equilibrium index if A[1] + A[2] + … + A[n-1] sums to 0 and n-1 is an equilibrium index if A[0] + A[1] + … + A[n-2] sums to 0.

 To illustrate, consider the array {0, -3, 5, -4, -2, 3, 1, 0}. The equilibrium index is found at index 0, 3, and 7.


# Solution =============================================

# Initialize the array
arr = [0, -3, 5, -4, -2, 3, 1, 0]

# Initialize variables
total_sum = arr.sum # Sum of all elements in the array
left_sum = 0 # Sum of elements on the left side of the current index
i = 0 # Index to iterate through the array
equilibrium_indices = [] # To store all equilibrium indices

# Loop through the array
while i < arr.length
  # Calculate the right sum for the current index by subtracting the current element and left sum from total sum
  right_sum = total_sum - arr[i] - left_sum
  
  # Check if left sum is equal to right sum
  if left_sum == right_sum
    # If they are equal, it means we found an equilibrium index
    equilibrium_indices << i # Add the current index to the list of equilibrium indices
  end
  
  # Update the left sum by adding the current element's value
  left_sum += arr[i]
  
  # Move to the next element in the array
  i += 1
end

# Print the equilibrium indices
puts "Equilibrium indices are: #{equilibrium_indices}" # Expected output: [0, 3, 7]


# Comment -----------------------------------------------------------------

# We start by calculating the total sum of the array elements.
# We then iterate through the array using a while loop.
# For each element, we calculate the right sum as the total sum minus the current element's value and the left sum so far.
# If the left sum equals the right sum, we've found an equilibrium index and add it to our list.
# We update the left sum by adding the current element's value before moving to the next element.
# Finally, we print out all the equilibrium indices we've found.        

# Problem -----------------------------------------------------------------

15. Rearrange an array with alternate high and low elements
Given an integer array, rearrange it such that every second element becomes greater than its left and right elements. Assume no duplicate elements are present in the array.

For example,

Input:  {1, 2, 3, 4, 5, 6, 7}Output: {1, 3, 2, 5, 4, 7, 6} Input:  {9, 6, 8, 3, 7}Output: {6, 9, 3, 8, 7} Input:  {6, 9, 2, 5, 1, 4}Output: {6, 9, 2, 5, 1, 4}

# Solution =============================================

  # Initialize the input array
input_array = [1, 2, 3, 4, 5, 6, 7]
# Output should be something like: [1, 3, 2, 5, 4, 7, 6]

# Start looping through the array from the first element
i = 0

while i < input_array.length - 1
    # Check if we are at an even position (considering 0 as even)
    # If so, we want to make sure the next element is larger
    if i.even?
        # If the current element is greater than the next,
        # we swap them to make sure the next is greater
        if input_array[i] > input_array[i + 1]
            input_array[i], input_array[i + 1] = input_array[i + 1], input_array[i]
        end
    else
        # Now, for odd positions, we want to make sure the current element
        # is greater than the next, so if it's not, we swap them
        if input_array[i] < input_array[i + 1]
            input_array[i], input_array[i + 1] = input_array[i + 1], input_array[i]
        end
    end
    
    # Move to the next element in the array
    i += 1
end

# Print the rearranged array
puts "Rearranged array: #{input_array}"
       
# Comment -----------------------------------------------------------------

# This code snippet starts with your initial array and iterates through it. Depending on the position (even or odd), it decides whether the next element should be greater or smaller. If the current arrangement doesn't meet the criteria, it swaps the elements. 

# Problem -----------------------------------------------------------------

14. Shuffle an array using Fisher–Yates shuffle algorithm
Given an integer array, in-place shuffle it. The algorithm should produce an unbiased permutation, i.e., every permutation is equally likely.

Fisher–Yates shuffle is an algorithm to generate random permutations. It takes time proportional to the total number of items being shuffled and shuffles them in place. The algorithm swaps the element at each iteration at random among all remaining unvisited indices, including the element itself.

Here’s the complete algorithm:

— To shuffle an array ‘a’ of ‘n’ elements:for i from n-1 down to 1 do    j = random integer such that 0 <= j <= i    exchange a[j] and a[i]

  

# Solution =============================================

# Initialize the array to shuffle
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Get the length of the array
n = array.length

# Start from the end of the array and move towards the beginning
i = n - 1

while i > 0
  # Generate a random index from 0 to i
  j = rand(0..i)

  # Swap elements at indices i and j
  array[i], array[j] = array[j], array[i] # This is how you swap in Ruby

  # Move to the previous element
  i -= 1 # Same as i = i - 1
end

# Print the shuffled array
puts "Shuffled array: #{array}"


# Initialize the array: We start with an array of numbers from 1 to 9.
# Get the length: We need the length of the array to know how many elements we have.
# Start from the end: We begin shuffling from the last element of the array and move towards the first.
# Generate a random index: For each element i, we pick a random index j between 0 and i (inclusive).
# Swap elements: We swap the elements at indices i and j. This is done in-place, meaning we don't need extra space to create a new array.
# Move to the previous element: We decrement i by 1 and repeat the process until we've gone through the entire array.
# Print the shuffled array: Finally, we print the shuffled array to see the result.
         

# Problem -----------------------------------------------------------------

13. Find the maximum product of two integers in an array
Given an integer array, find the maximum product of two integers in it.

For example, consider array {-10, -3, 5, 6, -2}. The maximum product is the (-10, -3) or (5, 6) pair.



# Solution =============================================

 # Initialize the array
numbers = [-10, -3, 5, 6, -2]

# Initialize variables
max1 = max2 = -Float::INFINITY # Use negative infinity to ensure any number we compare with is larger
min1 = min2 = Float::INFINITY # Use infinity to ensure any number we compare with is smaller

i = 0

# Find the two largest and two smallest numbers
while i < numbers.length
  num = numbers[i]
  
  # Update max values
  if num > max1
    max2 = max1 # Update second max to be the old max
    max1 = num # Update max to be the current number
  elsif num > max2
    max2 = num
  end
  
  # Update min values
  if num < min1
    min2 = min1 # Update second min to be the old min
    min1 = num # Update min to be the current number
  elsif num < min2
    min2 = num
  end
  
  i += 1
end

# Calculate the maximum product
max_product = [max1 * max2, min1 * min2].max

# Print the result
puts "The maximum product is: #{max_product}"


# Notes: It initializes variables to track the largest and smallest numbers found in the array.
# It uses a while loop to iterate through the array, updating these variables as it goes.
# It calculates the maximum product by considering both the product of the two largest numbers and the product of the two smallest numbers.
# Finally, it prints out the maximum product found.


# Problem -----------------------------------------------------------------

12. Find the index of 0 to be replaced to get the maximum length sequence of continuous ones
Given a binary array, find the index of 0 to be replaced with 1 to get the maximum length sequence of continuous ones.

For example, consider the array { 0, 0, 1, 0, 1, 1, 1, 0, 1, 1 }. We need to replace index 7 to get the continuous sequence of length 6 containing all 1’s.

# Solution =============================================

 # Initialize variables
binary_array = [0, 0, 1, 0, 1, 1, 1, 0, 1, 1]
max_count = 0 # To keep track of the maximum sequence of 1s
max_index = 0 # To keep track of the index of 0 to be replaced
current_count = 0 # To keep track of the current sequence of 1s
last_zero_index = -1 # To keep track of the last 0's index
i = 0 # Index for the while loop

# Loop through the binary array
while i < binary_array.length
    if binary_array[i] == 1
        # If the current element is 1, increase the current count
        current_count += 1
    else
        # If the current element is 0, reset the current count to the number of 1s after the last 0
        # Also, update the last_zero_index to the current index
        current_count = i - last_zero_index
        last_zero_index = i
    end
    
    # Check if the current sequence of 1s (including the replaced 0) is the longest so far
    if current_count > max_count
        max_count = current_count
        max_index = last_zero_index # The index of 0 to replace to get the longest sequence of 1s
    end
    
    # Move to the next element in the array
    i += 1
end

# Print the result
puts "Replace the 0 at index #{max_index} to get the longest continuous sequence of 1s of length #{max_count}."

This code snippet initializes several variables to keep track of the maximum sequence of 1s, the index of the last 0 encountered, and the current sequence length. As it iterates through the array, it updates these variables based on whether the current element is a 1 or a 0. When a 0 is encountered, it checks if replacing this 0 with a 1 would result in the longest sequence of 1s seen so far. After completing the iteration, it prints the index of the 0 that should be replaced to achieve the longest sequence of continuous 1s.



# Problem -----------------------------------------------------------------

11. Merge two arrays by satisfying given constraints
Given two sorted arrays X[] and Y[] of size m and n each where m >= n and X[] has exactly n vacant cells, merge elements of Y[] in their correct position in array X[], i.e., merge (X, Y) by keeping the sorted order.

For example,

Input: X[] = { 0, 2, 0, 3, 0, 5, 6, 0, 0 }Y[] = { 1, 8, 9, 10, 15 } The vacant cells in X[] is represented by 0 Output: X[] = { 1, 2, 3, 5, 6, 8, 9, 10, 15 }

# Solution =============================================

# Initialize the arrays
X = [0, 2, 0, 3, 0, 5, 6, 0, 0]
Y = [1, 8, 9, 10, 15]

# Function to move non-zero elements of X to the front
def move_non_zero_to_front(X)
  count = 0 # Count of non-zero elements
  # Traverse the array. If element encountered is non-zero, then
  # replace the element at 'count' index with this element
  for i in 0...X.length
    if X[i] != 0
      X[count] = X[i]
      count += 1
    end
  end
  # Now all non-zero elements have been shifted to the front and
  # 'count' is set as the index of first 0. Fill remaining positions with 0
  while count < X.length
    X[count] = 0
    count += 1
  end
end

# Function to merge Y into X
def merge(X, Y)
  move_non_zero_to_front(X) # First, move non-zero elements of X to the front
  
  m = X.count { |x| x != 0 } # Size of non-zero elements in X
  n = Y.length # Size of Y
  
  i = m - 1 # Last index of non-zero elements in X
  j = n - 1 # Last index of Y
  k = m + n - 1 # Last index of merged array
  
  # Merge Y into X from the back
  while j >= 0
    # If X is exhausted or Y's current element is larger
    if i < 0 or X[i] < Y[j]
      X[k] = Y[j]
      j -= 1
      k -= 1
    else
      X[k] = X[i]
      i -= 1
      k -= 1
    end
  end
end

# Merge Y into X
merge(X, Y)

# Print the result
puts "Merged array is: #{X}"

         

# Problem -----------------------------------------------------------------

10. In-place merge two sorted arrays
Given two sorted arrays, X[] and Y[] of size m and n each, merge elements of X[] with elements of array Y[] by maintaining the sorted order, i.e., fill X[] with the first m smallest elements and fill Y[] with remaining elements.

Do the conversion in-place and without using any other data structure.

 For example,

Input: X[] = { 1, 4, 7, 8, 10 }Y[] = { 2, 3, 9 } Output: X[] = { 1, 2, 3, 4, 7 }Y[] = { 8, 9, 10 }

# Solution =============================================

 # Initialize the arrays
x = [1, 4, 7, 8, 10]
y = [2, 3, 9]

# Start from the end of the first array and the beginning of the second array
i = x.length - 1
j = 0

# Loop until we reach the beginning of the first array and the end of the second array
while i >= 0 && j < y.length
  # If an element in the first array is bigger than an element in the second array
  if x[i] > y[j]
    # Swap the elements
    x[i], y[j] = y[j], x[i]
    # Since we've made a swap, we need to ensure the second array remains sorted
    # So, we sort the second array
    y.sort!
  end
  # Move to the next elements in the arrays
  i -= 1 # can be written i = i - 1
  j += 1 # can be written j = j + 1
end

# Now, we need to ensure the first array is sorted as well because the swapping might have disturbed its order
x.sort!

# Print the result
puts "X[] = #{x.inspect}" # This will show the first m smallest elements
puts "Y[] = #{y.inspect}" # This will show the remaining elements

#Starting from the end of X[] and the start of Y[].
#Swapping elements if an element in X[] is greater than an element in Y[].
#Sorting Y[] after each swap to maintain its sorted order.
#After completing the swaps, sorting X[] to ensure it is also in sorted order.
#- no extra data structures use
        

# Problem -----------------------------------------------------------------

9. Sort an array of 0’s, 1’s, and 2’s (Dutch National Flag Problem)
Given an array containing only 0’s, 1’s, and 2’s, sort it in linear time and using constant space.

For example,

Input:  { 0, 1, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0 } Output: { 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2 }

//We're going to use three pointers to solve it: one for 0s (let's call it low), one for the current element (let's call it mid), and one for 2s (let's call it high). The idea is to move 0s to the beginning, 2s to the end,

# Solution =============================================

 # Initialize the array
arr = [0, 1, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0]

# Initialize pointers
low = 0
mid = 0
high = arr.length - 1

# Use while loop to sort
while mid <= high
  case arr[mid]
  when 0
    # Swap if the element is 0
    arr[low], arr[mid] = arr[mid], arr[low]
    low += 1
    mid += 1
  when 1
    # Move to the next element if it's 1
    mid += 1
  when 2
    # Swap if the element is 2
    arr[mid], arr[high] = arr[high], arr[mid]
    high -= 1
  end
end

# Print the sorted array
puts "Sorted array: #{arr.inspect}"
        




# Problem -----------------------------------------------------------------

8.Find maximum length sub-array having equal number of 0’s and 1’s

Find the largest subarray having an equal number of 0’s and 1’s
Given a binary array containing 0’s and 1’s, find the largest subarray with equal numbers of 0’s and 1’s.

For example,

Input:  { 0, 0, 1, 0, 1, 0, 0 } Output: Largest subarray is { 0, 1, 0, 1 } or { 1, 0, 1, 0 }

# Solution =============================================

def find_largest_subarray(arr)
  # Initialize variables
  max_length = 0
  end_index = -1
  count = 0
  hash = {0 => -1} # To handle the case when subarray starts from index 0
  
  i = 0 # Start of the while loop
  while i < arr.length
      # Update count: +1 for 1, -1 for 0
      count += (arr[i] == 1) ? 1 : -1
      
      # Check if count is already in hash
      if hash[count]
          # Calculate the length of the current subarray
          if i - hash[count] > max_length
              max_length = i - hash[count]
              end_index = i
          end
      else
          # Store the first occurrence of this count
          hash[count] = i
      end
      
      i += 1 # Move to the next element
  end
  
  # Check if we found a subarray
  if end_index != -1
      # Return the subarray
      return arr[(end_index - max_length + 1)..end_index]
  else
      return "No such subarray exists"
  end
end

# Test the function
arr = [0, 0, 1, 0, 1, 0, 0]
puts "Largest subarray is: #{find_largest_subarray(arr)}"
       

# Problem -----------------------------------------------------------------

7.Find maximum length sub-array having given sum
Given an integer array, find the maximum length subarray having a given sum.

For example, consider the following array:

nums[] = { 5, 6, -5, 5, 3, 5, 3, -2, 0 }target = 8  Subarrays with sum 8 are { -5, 5, 3, 5 }{ 3, 5 }{ 5, 3 } The longest subarray is { -5, 5, 3, 5 } having length 4

# Solution =============================================

# Initialize variables
nums = [5, 6, -5, 5, 3, 5, 3, -2, 0]
target_sum = 8
max_length = 0
start_index = 0

# Loop through the array
i = 0
while i < nums.length
  current_sum = 0
  j = i # Start j from i
  
  while j < nums.length
    # Add the current number to the current_sum
    current_sum += nums[j]
    
    # Check if current_sum equals target_sum
    if current_sum == target_sum
      # Update max_length if this subarray is longer
      if (j - i + 1) > max_length
        max_length = j - i + 1
        start_index = i
      end
    end
    
    # Move to the next number in the array
    j += 1
  end
  
  # Move to the next starting point in the array
  i += 1
end

# Print the result
puts "Maximum length subarray with sum #{target_sum} is of length #{max_length}"
puts "Subarray: #{nums[start_index, max_length]}"

 #Output answer: Maximum length subarray with sum 8 is of length 4
#Subarray: [-5, 5, 3, 5]
                                 
# Problem -----------------------------------------------------------------

Find the largest subarray formed by consecutive integers
Given an integer array, find the largest subarray formed by consecutive integers. The subarray should contain all distinct values.

For example,

Input:  { 2, 0, 2, 1, 4, 3, 1, 0 } Output: The largest subarray is { 0, 2, 1, 4, 3 }

# Solution =============================================

    # Function to find the largest subarray formed by consecutive integers
def find_largest_consecutive_subarray(arr)
  # Initialize variables
  max_length = 0
  start_index = 0

  # Loop through the array
  i = 0
  while i < arr.length
    # Set to store unique elements and find consecutive numbers
    set = Set.new
    min_val = arr[i]
    max_val = arr[i]

    j = i
    while j < arr.length
      # If the element is already in set, break the loop
      break if set.include?(arr[j])

      # Add element to the set
      set.add(arr[j])

      # Update min and max values
      min_val = [min_val, arr[j]].min
      max_val = [max_val, arr[j]].max

      # Check if current subarray is consecutive
      if max_val - min_val == j - i
        if max_length < j - i + 1
          max_length = j - i + 1
          start_index = i
        end
      end

      # Move to the next element
      j += 1
    end

    # Move to the next starting point
    i += 1
  end

  # Return the largest subarray
  arr[start_index, max_length]
end

# Test the function with the given input
input_array = [2, 0, 2, 1, 4, 3, 1, 0]
result = find_largest_consecutive_subarray(input_array)
puts "The largest subarray is #{result}"


 
 # Problem -----------------------------------------------------------------

 Search element in array

 Given an integer array and another integer element. The task is to find if the given element is present in array or not.

 Example 1:
 
 Input:
 n = 4
 arr[] = {1,2,3,4}
 x = 3
 Output: 2
 Explanation: There is one test case 
 with array as {1, 2, 3 4} and element 
 to be searched as 3.  Since 3 is 
 present at index 2, output is 2.

# Solution =============================================

# Initialize variables
arr = [1, 2, 3, 4] # The array of integers
x = 3              # The element to find
index = -1         # Default index if element is not found

# Loop through the array
i = 0

while i < arr.length
    # Check if the current element is the one we're looking for
    if arr[i] == x
        # If found, set index to the current position
        index = i
        break      # Exit the loop since we found the element
    end

    # Move to the next element in the array
    i += 1
end

# Print the result
if index != -1
    puts "Element found at index: #{index}"
else
    puts "Element not found in the array"
end
 
 
 
 # Problem -----------------------------------------------------------------

 Problem: Finding a Book in a Library

 Story:
 You are in charge of managing a small library, and you want to help the library visitors find books easily. You have a list of books stored in an array, and you need to create a program that allows visitors to search for a book by its title. You decide to implement a linear search algorithm to achieve this.
 
 Variables:
 
 libraryBooks: An array that stores the titles of books in the library.
 targetBook: The title of the book that the visitor is looking for.
 foundBookIndex: A variable to store the index of the book if found, or -1 if not found.
 Task:
 Write a Ruby program to implement the linear search algorithm to help library visitors find a book by its title. Your program should do the following:
 
 Prompt the visitor to enter the title of the book they are looking for.
 Perform a linear search on the libraryBooks array to find the book.
 If the book is found, store its index in the foundBookIndex variable.
 If the book is not found, set foundBookIndex to -1.
 Display a message to the visitor indicating whether the book was found or not, along with its index if found.

# Solution =============================================

# Sample array of library books
libraryBooks = ["Harry Potter and the Sorcerer's Stone", "To Kill a Mockingbird", "The Great Gatsby", "1984", "The Catcher in the Rye", "Pride and Prejudice"]

# Prompt the visitor to enter the title of the book they are looking for
puts "Enter the title of the book you are looking for:"
targetBook = gets.chomp

# Initialize the foundBookIndex variable to -1
foundBookIndex = -1

# Perform a linear search to find the book
for i in 0..(libraryBooks.length - 1)
  if libraryBooks[i] == targetBook
    foundBookIndex = i
    break
  end
end

# Display the result
if foundBookIndex != -1
  puts "The book '#{targetBook}' was found at index #{foundBookIndex}."
else
  puts "The book '#{targetBook}' was not found in the library."
end

                        
                            
# Problem -----------------------------------------------------------------

find the minimum element of an array

# Initialize the array
arr = [38, 27, 43, 10]

# Solution =============================================

# Initialize the array
arr = [38, 27, 43, 10]

# Initialize variables
min_element = arr[0] # Assume the first element is the minimum

# Loop through the array
i = 1 # Start from the second element

while i < arr.length
    if arr[i] < min_element
        min_element = arr[i]
    end
    
    i += 1
end

# Print the minimum element
puts "The minimum element in the array is: #{min_element}"
                        
                     
# Problem -----------------------------------------------------------------

Write a program to reverse an array or string.

Given an array (or string), the task is to reverse the array/string.
Examples : 
 

Input  : arr[] = {1, 2, 3}
Output : arr[] = {3, 2, 1}

Input :  arr[] = {4, 5, 1, 2}
Output : arr[] = {2, 1, 5, 4}

# Solution =============================================

    # Initialize variables
arr = [1, 2, 3]
reversed_arr = []

# Initialize index variables
i = arr.length - 1

# Use a while loop to reverse the array
while i >= 0
    reversed_arr << arr[i]
    i -= 1
end

# Print the reversed array
puts "Reversed array: #{reversed_arr}" # Output: Reversed array: [3, 2, 1]


 # Problem -----------------------------------------------------------------

 Find the duplicate element in a limited range array
 Given a limited range array of size n containing elements between 1 and n-1 with one element repeating, find the duplicate number in it without using any extra space.
 
 For example,
 
 Input:  { 1, 2, 3, 4, 4 }Output: The duplicate element is 4  Input:  { 1, 2, 3, 4, 2 }Output: The duplicate element is 2

# Solution =============================================

    # Initialize the array
input_array = [1, 2, 3, 4, 4] # You can change this array to test different inputs

# Function to find the duplicate
def find_duplicate(arr)
    i = 0

    while i < arr.length
        # Check if the current element is at its correct position
        # If not, swap it to its correct position
        if arr[i] != arr[arr[i] - 1]
            arr[i], arr[arr[i] - 1] = arr[arr[i] - 1], arr[i]
        else
            # If we find a number which is already at its correct position
            # and it's not the first occurrence, it's the duplicate
            if i != arr[i] - 1
                return arr[i]
            end
            i += 1
        end
    end

    # If no duplicate found
    return "No duplicate found"
end

# Call the function and print the result
duplicate = find_duplicate(input_array)
puts "The duplicate element is #{duplicate}"


 

# Problem -----------------------------------------------------------------

Sort binary array in linear time
Given a binary array, sort it in linear time and constant space. The output should print all zeros, followed by all ones.

For example,

Input:  { 1, 0, 1, 0, 1, 0, 0, 1 } Output: { 0, 0, 0, 0, 1, 1, 1, 1 }

# Solution =============================================

    # Initialize the binary array
binary_array = [1, 0, 1, 0, 1, 0, 0, 1]

# Variables to keep track of zeros and array index
zero_count = 0
i = 0

# Loop through the binary array
while i < binary_array.length
    # Count the number of zeros
    if binary_array[i] == 0
        zero_count += 1
    end

    # Move to the next element in the array
    i += 1
end

# Fill the array with zeros and ones
i = 0
while i < zero_count
    binary_array[i] = 0
    i += 1
end

while i < binary_array.length
    binary_array[i] = 1
    i += 1
end

# Print the sorted array
puts "Sorted array: #{binary_array}" # Output: [0, 0, 0, 0, 1, 1, 1, 1]



# Problem -----------------------------------------------------------------

Print all subarrays with 0 sum
Given an integer array, print all subarrays with zero-sum.

For example,

Input:  { 4, 2, -3, -1, 0, 4 } Subarrays with zero-sum are { -3, -1, 0, 4 }{ 0 }  Input:  { 3, 4, -7, 3, 1, 3, 1, -4, -2, -2 } Subarrays with zero-sum are { 3, 4, -7 }{ 4, -7, 3 }{ -7, 3, 1, 3 }{ 3, 1, -4 }{ 3, 1, 3, 1, -4, -2, -2 }{ 3, 4, -7, 3, 1, 3, 1, -4, -2, -2 }



# Solution =============================================

# Initialize variables
input_array = [3, 4, -7, 3, 1, 3, 1, -4, -2, -2]
subarrays = []

# Loop through the array
i = 0
while i < input_array.length
    sum = 0
    j = i

    # Check for subarrays starting at index i
    while j < input_array.length
        sum += input_array[j] # Add the current element to sum

        # If sum becomes zero, we found a subarray
        if sum == 0
            subarrays << input_array[i..j] # Add the subarray to the result
        end

        j += 1 # Move to the next element
    end

    i += 1 # Move to the next starting point
end

# Print the result
puts "Subarrays with zero-sum are: #{subarrays}"

    
                  
# Problem -----------------------------------------------------------------

Check if a subarray with 0 sum exists or not
Given an integer array, check if it contains a subarray having zero-sum.

For example,

Input:  { 3, 4, -7, 3, 1, 3, 1, -4, -2, -2 } Output: Subarray with zero-sum exists The subarrays with a sum of 0 are: { 3, 4, -7 }{ 4, -7, 3 }{ -7, 3, 1, 3 }{ 3, 1, -4 }{ 3, 1, 3, 1, -4, -2, -2 }{ 3, 4, -7, 3, 1, 3, 1, -4, -2, -2 }


# Solution =============================================

# Initialize variables
input_array = [3, 4, -7, 3, 1, 3, 1, -4, -2, -2]
sums = Hash.new(0) # This hash will store the sums
sum = 0
zero_sum_subarray_exists = false

i = 0

# Loop through the array
while i < input_array.length
    sum += input_array[i] # Add current element to sum

    # Check if sum is 0 or if sum already exists in the hash
    if sum == 0 || sums[sum]
        zero_sum_subarray_exists = true
        break
    end

    sums[sum] = true # Store the sum in the hash

    i += 1 # Move to the next element
end

# Print the result
if zero_sum_subarray_exists
    puts "Subarray with zero-sum exists"
else
    puts "No subarray with zero-sum"
end
    


# Problem -----------------------------------------------------------------

Total Sum: 10

Find a pair with the given sum in an array
Given an unsorted integer array, find a pair with the given sum in it.

For example,

Input: nums = [8, 7, 2, 5, 3, 1]target = 10 Output: Pair found (8, 2)orPair found (7, 3)  Input: nums = [5, 2, 6, 8, 1, 9]target = 12 Output: Pair not found

# Solution =============================================

 # Initialize variables
nums = [8, 7, 2, 5, 3, 1]
target = 10
pair_found = false

# Loop through the array
i = 0

while i < nums.length
    j = i + 1 # Start j from the next element of i
    while j < nums.length
        # Check if the current pair sums up to the target
        if nums[i] + nums[j] == target
            puts "Pair found (#{nums[i]}, #{nums[j]})"
            pair_found = true
            break # Exit the loop once a pair is found
        end
        j += 1
    end
    break if pair_found # Exit the outer loop if a pair is found
    i += 1
end

puts "Pair not found" unless pair_found
   
                  
# Problem -----------------------------------------------------------------

Proverb

Instructions
For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"], you will output the full text of this proverbial rhyme:

For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.


# Solution =============================================

# Initialize the array with your items
items = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]

# This will store the lines of the proverb
proverb = []

# Loop through the items array
i = 0
while i < items.length - 1
    # Construct each line of the proverb
    line = "For want of a #{items[i]} the #{items[i + 1]} was lost."
    
    # Add the line to the proverb array
    proverb << line
    
    # Move to the next item
    i += 1
end

# Add the final line to the proverb
proverb << "And all for the want of a #{items[0]}."

# Print the proverb
puts proverb.join("\n")
  

             
# Problem -----------------------------------------------------------------


Brute to Linear: ETL #4

This is very similar to ETL #3, but you must now accomplish the task in linear time (O(N)).

Given an array of Youtube videos, for example:

[
{title: 'How to Make Wood', author_id: 4, views: 6},
{title: 'How to Seem Perfect', author_id: 4, views: 111},
{title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
{title: 'Why Pigs Stink', author_id: 1, views: 12}
]

and an array of authors, for example:

[
{id: 1, first_name: 'Jazz', last_name: 'Callahan'},
{id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
{id: 3, first_name: 'Saron', last_name: 'Kim'},
{id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

Return a new array of videos in the following format, and only include videos that have at least 100 views:

[
{title: 'How to Seem Perfect', views: 111, author_name: 'Teena Burgess' }
{title: 'Review of the New "Unbreakable Mug"', views: 202, author_name: 'Ichabod Loadbearer' },
]

# Solution =============================================

  # Initialize the arrays
videos = [
  {title: 'How to Make Wood', author_id: 4, views: 6},
  {title: 'How to Seem Perfect', author_id: 4, views: 111},
  {title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
  {title: 'Why Pigs Stink', author_id: 1, views: 12}
]

authors = [
  {id: 1, first_name: 'Jazz', last_name: 'Callahan'},
  {id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
  {id: 3, first_name: 'Saron', last_name: 'Kim'},
  {id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

# Prepare the result array
result = []

# Loop through the videos array
i = 0
while i < videos.length
  video = videos[i]

  # Check if the video has at least 100 views
  if video[:views] >= 100
    # Find the author of the video
    j = 0
    while j < authors.length
      author = authors[j]

      # Check if the author's id matches the video's author_id
      if author[:id] == video[:author_id]
        # Combine the video and author information
        video_info = {
          title: video[:title],
          views: video[:views],
          author_name: "#{author[:first_name]} #{author[:last_name]}"
        }

        # Add the combined information to the result array
        result << video_info
        break # Exit the inner loop once the author is found
      end

      j += 1
    end
  end

  i += 1
end

# Print the result
puts "Filtered videos are: #{result}"
  

             
# Problem -----------------------------------------------------------------


Brute to Linear: Two Sum II

This is the same exercise as Two Sum I, but you must now solve it in linear time.

Given an array of numbers, return a new array containing just two numbers (from the original array) that add up to the number 10. If there are no two numbers that add up to 10, return false.

Input: [2, 5, 3, 1, 0, 7, 11]
Output: [3, 7]

Input: [1, 2, 3, 4, 5]
Output: false (While 1, 2, 3, and 4 altogether add up to 10, we're seeking just one pair of numbers.)

# Solution =============================================

# Function to find two numbers that add up to 10
def find_two_sum(numbers)
    # Initialize variables
    i = 0
    j = 0

    # Loop through the array with two pointers
    while i < numbers.length
        j = i + 1 # Start j from the next element of i
        while j < numbers.length
            # Check if the sum of numbers at i and j is 10
            if numbers[i] + numbers[j] == 10
                # Return the pair if the sum is 10
                return [numbers[i], numbers[j]]
            end
            j += 1 # Move to the next element in the array
        end
        i += 1 # Move to the next element in the array
    end

    # Return false if no pair adds up to 10
    false
end

# Test the function with your examples
puts "Output: #{find_two_sum([2, 5, 3, 1, 0, 7, 11])}" # Should output [3, 7]
puts "Output: #{find_two_sum([1, 2, 3, 4, 5])}"       # Should output false


       
# Problem -----------------------------------------------------------------


 Brute to Linear: First Unique Character

 Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Examples:

s = "leetcode"
return 0.
(The "l" is the first character that only appears once in the string, and appears at index 0.)

s = "loveleetcode",
return 2.
(The "l" and "o" are repeated, so the first non-repeating character is the "v", which is at index 2.)

Note: You may assume the string contain only lowercase letters.

# Solution =============================================

def first_uniq_char(s)
  # Initialize variables
  char_count = Hash.new(0) # Hash to store character counts
  char_order = []          # Array to store the order of characters

  # First loop: Count characters and store their order
  i = 0
  while i < s.length
      char = s[i]
      char_count[char] += 1
      char_order << char unless char_count[char] > 1
      i += 1
  end

  # Second loop: Find the first unique character
  j = 0
  while j < char_order.length
      return s.index(char_order[j]) if char_count[char_order[j]] == 1
      j += 1
  end

  # If no unique character found, return -1
  -1
end

# Test the function
puts first_uniq_char("leetcode")      # Output: 0
puts first_uniq_char("loveleetcode")  # Output: 2


  

# Problem -----------------------------------------------------------------

From Brute to Linear: Missing Letter

A given string contains all the letters from the alphabet except for one. Return the missing letter.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: “The quick brown box jumps over a lazy dog”
Output: “f”

# Solution =============================================

# Initialize variables
input_string = "The quick brown box jumps over a lazy dog"
alphabet = ("a".."z").to_a
result = nil

# Convert input string to downcase and split into an array of characters
input_array = input_string.downcase.chars

# Sort the array to ensure the order (not necessary if input is already sorted)
input_array.sort!

# Loop through the alphabet
i = 0
j = 0

while i < alphabet.length
  # Check if the current letter in the alphabet is in the input array
  if j < input_array.length && alphabet[i] == input_array[j]
    # If it is, move to the next letter in the input array
    j += 1
  else
    # If it isn't, we've found our missing letter
    result = alphabet[i]
    break # Exit the loop since we found the missing letter
  end

  # Move to the next letter in the alphabet
  i += 1
end

# Print the result
puts "The missing letter is: #{result}"
  

# Problem -----------------------------------------------------------------

From Brute to Linear: Array Duplicate

A given array has one pair of duplicate values. Return the first duplicate value.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [5, 2, 9, 7, 2, 6]
Output: 2


# Solution =============================================

# Initialize variables
input_array = [5, 2, 9, 7, 2, 6]
seen_numbers = {}
first_duplicate = nil

# Loop through the array
i = 0

while i < input_array.length
  # Check if the number is already in the hash
  if seen_numbers[input_array[i]]
    first_duplicate = input_array[i]
    break
  else
    # Add the number to the hash
    seen_numbers[input_array[i]] = true
  end
  
  # Move to the next number in the array
  i += 1
end

# Print the first duplicate
if first_duplicate
  puts "First duplicate is: #{first_duplicate}" # Output: 2
else
  puts "No duplicates found."
end


# Problem -----------------------------------------------------------------

From Brute to Linear: Array Subset

Given two arrays, determine whether one is a subset of the other. It is considered a subset if all the values in one array are contained within the other.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5, 6], [6, 3, 2]
Output: true

Input: [1, 2, 3, 4, 5, 6], [6, 3, 7]
Output: false

# Solution =============================================

    # Initialize variables
first_array = [1, 2, 3, 4, 5, 6]
second_array = [6, 3, 2]
result = true

# Create a hash to store the elements of the first array
hash_map = {}

# Loop through the first array to populate the hash
i = 0
while i < first_array.length
  hash_map[first_array[i]] = true
  i += 1
end

# Loop through the second array to check if each element exists in the hash
j = 0
while j < second_array.length
  unless hash_map[second_array[j]]
    result = false
    break
  end
  j += 1
end

# Print the result
puts "Is the second array a subset of the first? #{result}"

     
   
# Problem -----------------------------------------------------------------


From Brute to Linear: Array Intersection

Given two arrays, return a new array that contains the intersection of the two arrays. The intersection means the values that are contained in both of the arrays. Do not use the "&", or any built-in intersection methods.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5], [1, 3, 5, 7, 9]
Output: [1, 3, 5]



# Solution =============================================

   # Initialize variables
first_array = [1, 2, 3, 4, 5]
second_array = [1, 3, 5, 7, 9]
result = []

# Create a hash to store elements of the first array
hash_map = {}
i = 0
while i < first_array.length
  hash_map[first_array[i]] = true
  i += 1
end

# Loop through the second array to find common elements
j = 0
while j < second_array.length
  # Check if the element exists in the hash
  if hash_map[second_array[j]]
    result << second_array[j] # Add to the result array
  end
  j += 1
end

# Print the result
puts "Intersection is: #{result}" # Output should be [1, 3, 5]
 
     
        
        
# Problem -----------------------------------------------------------------

#Data Transformation: ETL #3

Given an array of Youtube videos, for example:

[
{title: 'How to Make Wood', author_id: 4, views: 6},
{title: 'How to Seem Perfect', author_id: 4, views: 111},
{title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
{title: 'Why Pigs Stink', author_id: 1, views: 12}
]

and an array of authors, for example:

[
{id: 1, first_name: 'Jazz', last_name: 'Callahan'},
{id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
{id: 3, first_name: 'Saron', last_name: 'Kim'},
{id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

Return a new array of videos in the following format, and only include videos that have at least 100 views:

[
{title: 'How to Seem Perfect', views: 111, author_name: 'Teena Burgess' }
{title: 'Review of the New "Unbreakable Mug"', views: 202, author_name: 'Ichabod Loadbearer' },
]



# Solution =============================================

# Given data
videos = [
  { title: 'How to Make Wood', author_id: 4, views: 6 },
  { title: 'How to Seem Perfect', author_id: 4, views: 111 },
  { title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202 },
  { title: 'Why Pigs Stink', author_id: 1, views: 12 }
]

authors = [
  { id: 1, first_name: 'Jazz', last_name: 'Callahan' },
  { id: 2, first_name: 'Ichabod', last_name: 'Loadbearer' },
  { id: 3, first_name: 'Saron', last_name: 'Kim' },
  { id: 4, first_name: 'Teena', last_name: 'Burgess' }
]

# Initialize variables
i = 0
result = []

# Loop through the videos array
while i < videos.length
  video = videos[i]

  # Check if the video has at least 100 views
  if video[:views] >= 100

    # Find the author associated with the video
    author = authors.find { |author| author[:id] == video[:author_id] }

    # Create the author's full name
    author_name = "#{author[:first_name]} #{author[:last_name]}"

    # Create a formatted video hash
    formatted_video = {
      title: video[:title],
      views: video[:views],
      author_name: author_name
    }

    # Add the formatted video to the result array
    result << formatted_video
  end

  # Move to the next video in the loop
  i += 1
end

# Print the result
puts "Filtered and formatted videos:"
puts result
    


# Problem -----------------------------------------------------------------

        Data Transformation: Book Organizer

        Given a list of books provided in this format:
        
        [
        {title: "The Lord of the Rings", author: "J. R. R. Tolkien", year: 1954 },
        {title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960 },
        {title: "1984", author: "George Orwell", year: 1949 },
        {title: "Go Set a Watchman", author: "Harper Lee", year: 2015 },
        {title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937 },
        {title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925 },
        {title: "The Two Towers", author: "J. R. R. Tolkien", year: 1954 }
        ]
        
        return the data in this new author-centric format:
        
        { "J. R. R. Tolkien" => [
        {title: "The Lord of the Rings", year: 1954 },
        {title: "The Hobbit", year: 1937 },
        {title: "The Two Towers", year: 1954 }
        ],
        "Harper Lee" => [
        {title: "To Kill a Mockingbird", year: 1960 },
        {title: "Go Set a Watchman", year: 2015 }
        ],
        "George Orwell" => [
        {title: "1984", year: 1949 }
        ],
        "F. Scott Fitzgerald" => [
        {title: "The Great Gatsby", year: 1925 }
        ]
        }


# Solution =============================================

    # Given list of books
books = [
  {title: "The Lord of the Rings", author: "J. R. R. Tolkien", year: 1954 },
  {title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960 },
  {title: "1984", author: "George Orwell", year: 1949 },
  {title: "Go Set a Watchman", author: "Harper Lee", year: 2015 },
  {title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937 },
  {title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925 },
  {title: "The Two Towers", author: "J. R. R. Tolkien", year: 1954 }
]

# Initialize a hash to store author-centric data
author_centric = {}

# Initialize variables for the loop
i = 0
while i < books.length
  book = books[i]
  author = book[:author]
  
  # Create a new entry for the author if it doesn't exist
  author_centric[author] ||= []

  # Add book information to the author's entry
  author_centric[author] << {title: book[:title], year: book[:year]}

  # Move to the next book
  i += 1
end

# Print the author-centric data
puts author_centric


        # Problem -----------------------------------------------------------------

Data Transformation: Complete the Data II

Given an array of social media posts and an array of users, return a list of posts (as an array of hashes) that replaces the submitted_by id number as the person's actual name.

For example, given this array of posts (note that the submitted_by is an id number):

[
{title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
{title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
{title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

And this array of users:

[
{user_id: 403, name: "Aunty Em"},
{user_id: 231, name: "Joelle P."},
{user_id: 989, name: "Lyndon Johnson"},
{user_id: 111, name: "Patti Q."},
]

Return the array of posts as follows:

[
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]



#Solution =============================================

#Given array of posts
posts = [
  { title: 'Me Eating Pizza', submitted_by: 231, likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: 111, likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: 403, likes: 644 }
]

#Given array of users
users = [
  { user_id: 403, name: "Aunty Em" },
  { user_id: 231, name: "Joelle P." },
  { user_id: 989, name: "Lyndon Johnson" },
  { user_id: 111, name: "Patti Q." }
]

#Initialize an empty result array
result = []

#Loop through posts
i = 0
while i < posts.length
  post = posts[i]
  user_id = post[:submitted_by]

  # Find the user with the matching user_id
  j = 0
  while j < users.length
    user = users[j]
    if user[:user_id] == user_id
      # Replace the user_id with the user's name
      post[:submitted_by] = user[:name]
      break # No need to continue searching for this post
    end
    j += 1
  end

  # Add the modified post to the result array
  result << post

  i += 1
end

# Print the result
result.each do |post|
  puts post
end

    
    
    # Problem -----------------------------------------------------------------

Data transformation: ETL #2

    You are given a hash in format #A, and you are to return the same data as a hash using format #B, as specified below:

    Input:
    
    {
    1 => ["A", "E", "I", "O", "U"]
    }
    
    Output:
    
    {
    'a' => 1,
    'e' => 1,
    'i' => 1,
    'o' => 1,
    'u' => 1
    }
    Input:
    
    {
    1 => ["A", "E"],
    2 => ["D", "G"]
    }
    
    Output:
    
    {
    'a' => 1,
    'd' => 2,
    'e' => 1,
    'g' => 2
    }
    
    Input:
    
    {
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
    }
    
    Output:
    
    {
    'a' => 1,
    'b' => 3,
    'c' => 3,
    'd' => 2,
    'e' => 1,
    'f' => 4,
    'g' => 2,
    'h' => 4,
    'i' => 1,
    'j' => 8,
    'k' => 5,
    'l' => 1,
    'm' => 3,
    'n' => 1,
    'o' => 1,
    'p' => 3,
    'q' => 10,
    'r' => 1,
    's' => 1,
    't' => 1,
    'u' => 1,
    'v' => 4,
    'w' => 4,
    'x' => 8,
    'y' => 4,
    'z' => 10
    }

# Solution =============================================

# Initialize variables
input_hash = {
  1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2 => ["D", "G"],
  3 => ["B", "C", "M", "P"],
  4 => ["F", "H", "V", "W", "Y"],
  5 => ["K"],
  8 => ["J", "X"],
  10 => ["Q", "Z"]
}

output_hash = {}

# Loop through the input hash
i = 0
keys = input_hash.keys
while i < keys.length
  key = keys[i]
  value_array = input_hash[key]
  
  j = 0
  while j < value_array.length
    # Convert each letter to lowercase and add to output hash
    letter = value_array[j].downcase
    output_hash[letter] = key
    
    # Move to the next letter in the value array
    j += 1
  end
  
  # Move to the next key in the input hash
  i += 1
end

# Print the result
puts "Transformed hash is: #{output_hash}"

  
  # Problem -----------------------------------------------------------------

  Data Transformation: Flip Hash

  Given a hash, create a new hash that has the keys and values switched.

Input: {"a" => 1, "b" => 2, "c" => 3}
Output: {1 => "a", 2 => "b", 3 => "c"}




# Solution =============================================

# Initialize variables
original_hash = {"a" => 1, "b" => 2, "c" => 3}
keys = original_hash.keys
values = original_hash.values
new_hash = {}

# Initialize loop variables
i = 0

# Loop through the original hash
while i < keys.length
  # Switch keys and values
  new_key = values[i]
  new_value = keys[i]
  
  # Add the switched key-value pair to the new hash
  new_hash[new_key] = new_value
  
  # Move to the next key-value pair in the original hash
  i += 1 # same as i = i + 1
end

# Print the new hash
puts "The new hash is: #{new_hash}" # Output: {1 => "a", 2 => "b", 3 => "c"}


  # Problem -----------------------------------------------------------------

  Data Transformation: Flatten Hash

  Given a hash, return a flat array containing all the hash’s keys and values.
  
  Input: {“a” => 1, “b” => 2, “c” => 3, “d” => 4}
  Output: [“a”, 1, “b”, 2, “c”, 3, “d”, 4]
  

# Solution =============================================

# Initialize variables
input_hash = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
output_array = []

# Get keys and values arrays from the hash
keys_array = input_hash.keys
values_array = input_hash.values

# Initialize loop variables
i = 0

# Loop through the hash
while i < keys_array.length
  # Add the key to the output array
  output_array << keys_array[i]
  
  # Add the value to the output array
  output_array << values_array[i]
  
  # Move to the next key-value pair in the hash
  i += 1
end

# Print the result
puts "Flattened array is: #{output_array}"

#Flattened array is: ["a", 1, "b", 2, "c", 3, "d", 4]


# Problem -----------------------------------------------------------------

Basic Hash: Anagrams

Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

Do not use any built-in sort methods.

Input: “silent”, “listen”
Output: true

Input: “frog”, “bear”
Output: false




# Solution =============================================
 
# Initialize variables
first_string = "silent"
second_string = "listen"
result = true

# Check if the lengths are the same, if not, they can't be anagrams
if first_string.length != second_string.length
  result = false
else
  # Loop through each character in the first string
  i = 0
  while i < first_string.length
    char = first_string[i]
    found = false

    # Loop through each character in the second string
    j = 0
    while j < second_string.length
      if char == second_string[j]
        # Remove the found character from the second string
        second_string = second_string[0, j] + second_string[j + 1, second_string.length]
        found = true
        break
      end
      j += 1
    end

    # If a character in the first string is not found in the second string, they are not anagrams
    if !found
      result = false
      break
    end

    i += 1
  end
end

# Print the result
puts "Are they anagrams? #{result}"  # Output should be true or false

 
 # Problem -----------------------------------------------------------------
Basic Hash: Complete Data

 Given an array of social media posts and a hash of users, return a list of posts (as an array of hashes) that replaces the submitted_by id number as the person's actual name.

For example, given this array of posts (note that the submitted_by is an id number):

[
{title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
{title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
{title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

And this hash of users (the key is the id number and the value is the user's real name):

users = {403 => "Aunty Em", 231 => "Joelle P.", 989 => "Lyndon Johnson", 111 => "Patti Q."}

Return the array of posts as follows:

[
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]




# Solution =============================================

# Initialize variables
posts = [
  {title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
  {title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
  {title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
  {title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

users = {403 => "Aunty Em", 231 => "Joelle P.", 989 => "Lyndon Johnson", 111 => "Patti Q."}
updated_posts = []

# Loop through the posts array
i = 0
while i < posts.length
    # Create a new post hash and update the submitted_by field with the name
    post = posts[i]
    user_name = users[post[:submitted_by]]
    
    # Replace the ID with the actual name
    post[:submitted_by] = user_name
    
    # Add the updated post to the updated_posts array
    updated_posts << post
    
    # Move to the next post in the posts array
    i += 1
end

# Print the updated posts
puts "Updated posts are: #{updated_posts}"


 # Problem -----------------------------------------------------------------

 Basic Hash: RNA Transcription

 Given a DNA strand, return its RNA complement (per RNA transcription).

Both DNA and RNA strands are a sequence of nucleotides. Here we're representing the sequences with single-letter characters (e.g. a sample strand may look like: "AGCA".)

Given a string representing a DNA strand, provide its transcribed RNA strand, according to the following pattern:

G becomes C
C becomes G
T becomes A
A becomes U

So based on all this, here's a sample input/output:

Input: 'ACGTGGTCTTAA'
Output: 'UGCACCAGAAUU'


# Solution =============================================

# Initialize variables
dna_strand = 'ACGTGGTCTTAA'
rna_strand = ''
i = 0

# Loop through the DNA strand
while i < dna_strand.length
  nucleotide = dna_strand[i]
  
  # Transcribe the current nucleotide and add it to the RNA strand
  if nucleotide == 'G'
    rna_strand += 'C'
  elsif nucleotide == 'C'
    rna_strand += 'G'
  elsif nucleotide == 'T'
    rna_strand += 'A'
  elsif nucleotide == 'A'
    rna_strand += 'U'
  else
    # Handle invalid input (if any)
    puts "Invalid nucleotide found: #{nucleotide}"
  end
  
  # Move to the next nucleotide in the DNA strand
  i += 1
end

# Print the transcribed RNA strand
puts "Transcribed RNA strand: #{rna_strand}"


 # Problem -----------------------------------------------------------------

 Basic Hash: Popular Post

 Description
Given an array of hashes that represent a list of social media posts, return a new array that only contains the posts that have at least 1000 likes.

Input: [
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]

Output: [
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
]





# Solution =============================================

# Given input
posts = [
  { title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644 }
]

# Initialize an empty array to store posts with at least 1000 likes
popular_posts = []

# Iterate through each post in the input array
posts.each do |post|
  # Check if the post has at least 1000 likes
  if post[:likes] >= 1000
    # If yes, add it to the popular_posts array
    popular_posts << post
  end
end

# Output the filtered array of popular posts
puts popular_posts


 # Problem -----------------------------------------------------------------

 Basic Hash: Menu Pair

 Given a hash, where the keys are strings representing food items, and the values are numbers representing the price of each food, return the amount someone would pay if they'd order one of each food from the entire menu.

 Input: {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
 
 Output: 14
 
 Explanation: If someone would order one of everything on the menu, they'd pay a total of 14 (the sum of all the hash's values).
 
 

#Solution =============================================

# Initialize variables
menu = {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
total_price = 0

# We need keys from the hash to loop through it
menu_keys = menu.keys

# Loop through the hash using while loop
i = 0

while i < menu_keys.length
    # Get the food item
    food_item = menu_keys[i]
    
    # Add its price to total_price
    total_price += menu[food_item]  # total_price = total_price + menu[food_item]
    
    # Move to the next food item in the hash
    i += 1  # same as i = i + 1
end

# Print the total_price
puts "Total price of one of everything: #{total_price}"  # Output should be 14




 # Problem -----------------------------------------------------------------

 Basic Hash: Count Words

Given an array of strings, return a hash that provides of a count of how many times each string occurs.

Input: ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"]

Output: {"Dewey" => 6, "Truman" => 5}

Explanation: "Dewey" occurs 6 times in the array, while "Truman" occurs 5 times.

# Solution =============================================

# Initialize variables
words_array = ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"]
word_count = {}

# Loop through the array
i = 0
while i < words_array.length
    word = words_array[i]
    
    # Check if the word is already in the hash
    if word_count [word]
        word_count[word] += 1 # Increment the count
    else
        word_count[word] = 1 # Initialize the count
    end
    
    # Move to the next word in the array
    i += 1 # Same as i = i + 1
end

# Print the result

puts "Word counts are: #{word_count}"  # Output: {"Dewey" => 6, "Truman" => 5}


 # Problem -----------------------------------------------------------------

 Basic Hash: Most Common Letter

 Given a string, find the most commonly occurring letter.

Input: “peter piper picked a peck of pickled peppers”
Output: “p”


 
# Solution =============================================

# Input String
input_str = "peter piper picked a peck of pickled peppers"

# Initialize variables
char_count = {}
most_common_char = nil
max_count = 0

# Loop through the characters in the input string using each_char
input_str.each_char do |char|
  next if char == ' '  # Skip empty space

  # Assign the current value if it exists, if not assign 0
  char_count[char] ||= 0
  char_count[char] += 1

  # Check if this character has the highest count currently
  if char_count[char] > max_count
    max_count = char_count[char]
    most_common_char = char
  end
end

# Print the most common letter
puts "Most common character is: '#{most_common_char}'"


 # Problem -----------------------------------------------------------------

Two Pointers - Longest Common Prefix

 Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z.

# Solution =============================================

def longest_common_prefix(strings)
  # Initialize variables
  return "" if strings.length == 0
  
  #Take the first string as a reference for the longest_common_prefix
  prefix = strings[0]
  i = 1
  
  # Loop through the other strings in the array
  while i < strings.length
      # REset j ofr each new string
      j = 0
      
      # Loop through characters of prefix and each string
      while j < prefix.length && j < strings[i].length
          # If characters don't match, break
          break if prefix[j] != strings[i][j]
          
          # Move to the next character in prefix and string
          j += 1
      end
          
          #update the prefix
          prefix = prefix[0, j]
          
          # If prefix has no length, no point in continuing
          return "" if prefix.length == 0
          
          # Move to the next string in the array
          i += 1
      end
      
      # Return the longest common prefix
      return prefix
  end
  
  # Test the function
  puts longest_common_prefix(["flower", "flow", "flight"])
  puts longest_common_prefix(["dog", "racecar", "car"])

 # Problem -----------------------------------------------------------------

# Two Pointers - 100 Coolio Array

 Use example structure below and using Ruby language solve  Given an array of numbers, return true if the array is a "100 Coolio Array", or false if it is not.

A "100 Coolio Array" meets the following criteria:

Its first and last numbers add up to 100,
Its second and second-to-last numbers add up to 100,
Its third and third-to-last numbers add up to 100,
and so on and so forth.

Here are examples of 100 Coolio Arrays:

[1, 2, 3, 97, 98, 99]
[90, 20, 70, 100, 30, 80, 10]




# Solution =============================================

# Initialize variables
num_array = [1, 2, 3, 97, 98, 99]
is_coolio = true # We'll assume it's a Coolio array until proven otherwise

# Initialize loop variables
i = 0
j = num_array.length - 1 # Start at the last element

# Loop through the array
while i < j
  # Check if the sum of the i-th and j-th elements is 100
  if num_array[i] + num_array[j] != 100
    is_coolio = false # Not a Coolio array
    break # No need to check further
  end
  
  # Move to the next pair of elements
  i += 1
  j -= 1
end

# Print the result
if is_coolio
  puts "Yep, it's a 100 Coolio Array!"
else
  puts "Nah, it's not a 100 Coolio Array."
end



 # Problem -----------------------------------------------------------------


Two Pointers - Merge Sorted Arrays

 Given two sorted arrays, merge the second array into the first array while ensuring that the first array remains sorted. Do not use any built-in sort methods.

 Input :
 A : [1, 5, 8]
 B : [6, 9]
 
 Modified A : [1, 5, 6, 8, 9]

 # Solution =============================================

 # Initialize variables
first_array = [1, 5, 8]
second_array = [6, 9]
result = []

# Pointers for first and second array
i = 0
j = 0

# Loop through both arrays
while i < first_array.length || j < second_array.length
  # Check the elements in both arrays and merge
  if i >= first_array.length
    result << second_array[j]
    j += 1
  elsif j >= second_array.length
    result << first_array[i]
    i += 1
  elsif first_array[i] < second_array[j]
    result << first_array[i]
    i += 1
  else
    result << second_array[j]
    j += 1
  end
end

# Print the result
puts "Merged and sorted array is: #{result}"


 # Problem -----------------------------------------------------------------


 Two Pointers - Two sums

 Given an array of numbers, return a new array containing just two numbers (from the original array) that add up to the number 10. If there are no two numbers that add up to 10, return false.

Specifically use nested loops to solve this exercise even though there are other approaches as well.

Input: [2, 5, 3, 1, 0, 7, 11]
Output: [3, 7]

Input: [1, 2, 3, 4, 5]
Output: false (While 1, 2, 3, and 4 altogether add up to 10, we're seeking just one pair of numbers.)


 # =============================================

 # Initialize variables
input_array = [2, 5, 3, 1, 0, 7, 11]
result = []

# Loop through the array
i = 0
while i < input_array.length
  j = i + 1 # Start j from the next element of i
  while j < input_array.length
    # Check if the numbers add up to 10
    if input_array[i] + input_array[j] == 10
      result << input_array[i]
      result << input_array[j]
      break # Exit the inner loop
    end
    j += 1 # Move to the next number in the array
  end
  break if result.length > 0 # Exit the outer loop if we found a pair
  i += 1 # Move to the next number in the array
end

# Print the result
if result.length > 0
  puts "The numbers are: #{result}"
else
  puts "No pair adds up to 10."
end


 # -----------------------------------------------------------------

 Two Pointers - Largest Product 

 Find the largest product of any two numbers within a given array.

Input: [5, -2, 1, -9, -7, 2, 6]
Output: 63 (-9 * -7)



 # =============================================
# Initialize variables
input_array = [5, -2, 1, -9, -7, 2, 6]
largest_product = input_array[0] * input_array[1] # Start with the product of the first two numbers

# Loop through the array
i = 0
j = 0

while i < input_array.length
  j = i + 1 # Start j from the next element of i
  while j < input_array.length
    # Calculate the product of the two numbers
    current_product = input_array[i] * input_array[j]
    
    # Check if this product is larger than the current largest_product
    if current_product > largest_product
      largest_product = current_product
    end
    
    # Move to the next number in the second loop
    j += 1 # can be written as: j = j + 1
  end
  
  # Move to the next number in the first loop
  i += 1 # can be written as: i = i + 1
end

# Print the largest product
puts "The largest product is: #{largest_product}" # Output should be 63 (-9 * -7)

NOTE: So, what this code does is it goes through each pair of numbers in the array and multiplies them. If the product is bigger than the current largest product, it updates the largest product. Finally, it prints out the largest product. Hope that helps!


 # -----------------------------------------------------------------

 Given ONE array of strings, return a new array that contains every combination of each string with every other string in the array.

Input: ["a", "b", "c", "d"]
Output: ["ab", "ac", "ad", "ba", "bc", "bd", "ca", "cb", "cd", "da", "db", "dc"]


 # =============================================




# Input array of strings
input_array = ["a", "b", "c", "d"]

# Initialize variables
result = []
i = 0

# Loop through the array
while i < input_array.length
    j = 0 # Reset j for each new i
    while j < input_array.length
        # Skip if it's the same index
        if i != j
            # Combine strings from the array
            combo = input_array[i] + input_array[j]
            
            # Add the combo to the result array
            result << combo
            
            # Move to the next string
            j += 1
        else
            j += 1
        end
    end
    
    # Move to the next string
    i += 1
end

# Print the result
puts "Combinations are: #{result}"


 # -----------------------------------------------------------------


Two Pointers Array Mesh I

Given two arrays of strings, return a new string that contains every combination of a string from the first array concatenated with a string from the second array.

Input: ["a", "b", "c"], ["d", "e", "f", "g"]
Output: ["ad", "ae", "af", "ag", "bd", "be", "bf", "bg", "cd", "ce", "cf", "cg"]

 # =============================================

# Initalize variables
first_array = ["a", "b", "c"]
second_array = ["d", "e", "f", "g"]
result = []

# Loop through both arrays
i = 0
j = 0

while i < first_array.length
    j = 0 # Reset j for each new i
    while j < second_array.length
        #Combine strings from both arrays
        combo = first_array[i] + second_array[j]
        
        #Add the combo to the result array
        result << combo # same as result.push(combo)
        
        #Move to the next string in the second array
        j += 1 # can be written j = j + 1
    end
        
        #Move to the next string in the first array
        i += 1 # can be written i = i + 1
    end
    
    #Print the result
    puts "Combinations are: #{result}" # Result # ["ad", "ae", "af", "ag", "bd", "be", "bf", "bg", "cd", "ce", "cf", "cg"]

 # -----------------------------------------------------------------

Basic Numbers - Largest Palindrome Product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

 # =============================================


 #Initialize variable
largest_palindrome = 0
i = 100
j = 100

# Loop until both i and j reach 100
while i <= 999 && j <= 999
    # Calculate the product
    product = i * j
    str_product = product.to_s
    is_palindrom = true
    
    # Manually check if it's a palindrom
    len = str_product.length
    half_len = len / 2
    index = 0
    
    while index < half_len
        if str_product[index] != str_product[len - index - 1]
            is_palindrome = false
            break
        end
        index += 1
    end
    
    # Update largest_palindrome if its a palindrom is bigger 
    if is_palindrom && product > largest_palindrome
        largest_palindrome = product
    end
    
    # Update i and j
    
    if j < 999
        j += 1
    else
        i += 1
        j = 100
    end
end

puts "The largest palindrom made from the product of two 3-digit numbers is #{largest_palindrome}" // 906609
    

# -----------------------------------------------------------------


Basic Numbers - Collatz Conjecture

The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.

Examples
Starting with n = 12, the steps would be as follows:

12
6
3
10
5
16
8
4
2
1

Resulting in 9 steps. So for input n = 12, the return value would be 9.

# =============================================

n = 12 # you can replace this with any number you want to check
steps = 0

while n != 1
  if n % 2 == 0
    n = n / 2
  else
    n =3 * n + 1
  end
  steps += 1 # can be written as: steps = steps + 1
end

puts "It took #{steps} steps to reach 1"


# -----------------------------------------------------------------

Basic Numbers - Sum of Multiples

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.


# =============================================

sum = 0
num = 1

while num < 1000
  if num % 3 == 0 || num % 5 == 0
    sum += num
  end
  num += 1
end

puts "The sum of all multiples of 3 or 5 below 1000 is #{sum}"

# -----------------------------------------------------------------


Basic Numbers - Leap Year


Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

on every year that is evenly divisible by 4
except every year that is evenly divisible by 100
unless the year is also evenly divisible by 400
For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

If your language provides a method in the standard library that does this look-up, pretend it doesn't exist and implement it yourself.

# =============================================

year = 2000 # you can replace this with any year you want to check

if (year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0))
  puts "#{year} is a leap year"
else
  puts "#{year} is not a leap year"
end

# -----------------------------------------------------------------




# Basic Numbers - Fibonacci Numbers - sum of previous two numbers

Write a function that gives the Nth number of the Fibonacci Sequence. The Fibonacci sequence begins with 0 and 1, and every number thereafter is the sum of the previous two numbers. So the sequence goes like this:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, and so on until infinity...

Input: 9
Output: 21 (as this is the 9th number of the Fibonacci Sequence)


# =============================================

n = 0
a = 0
b = 1
counter = 3

if n == 1 
    puts a  
    elsif n == 2
        puts b
    else
      while counter <= n
          temp = a
          a = b
          b = temp + b
          counter += 1
      end
      puts b
  end

# -----------------------------------------------------------------

Basic Numbers - FIZZBUZZ - divisible by 3 and/or 5

Write a function that prints out every number from 1 to N, with the following exceptions:

If the number is divisible by 3, print out "FIZZ".
If the number is divisible by 5, print out "BUZZ".
If the number is divisible by both 3 and 5, print out "FIZZBUZZ".

# =============================================

N = 15
x = 1

while x <= N
  if x % 3 == 0  && x % 5 == 0
    puts "FIZZBUZZ"
  elsif x % 3 == 0
    puts "FIZZ"
  elsif x % 5 == 0
      puts "BUZZ"
  else
      puts x 
  end
  x = x + 1
  end

# -----------------------------------------------------------------

Basic numbers - Prime numbers - Start of Basic Numbers Section

Write a function that returns whether a given number is a prime number.

number = 7

prime = true  
if number < 2
  prime = false
else
  x = 2
  while x * x <= number
    if number % x == 0
      prime = false
      break
    end
    x = x + 1
    # can be written as: x += 1
  end
end

if prime
  puts "#{number} is prime"
else
  puts "#{number} is not prime"
end
# -----------------------------------------------------------------

# Basic String - Reverse Words - End of Basic String Section

Given a string of words, write a function that returns a new string that contains the words in reverse order.

Input: “popcorn is so cool isn’t it yeah i thought so”
Output: “so thought i yeah it isn’t cool so is popcorn”

#Assign the string to a variable
input = "popcorn is so cool isn't it yeah i thought so"
#initialize a new variable to store the reversed string
output = ''
#initialize a empty array to store the words
words = ''
#initialize a index variable to track the current word in the string
index = 0

# Continue looping until we reach the end of the string
while index < input.length
  # Get the character at the current index
  char = input[index]
  # Check if the character is a space or the last character in the string
  if char == " " || index == input.length - 1
   # Add the current word to the beginning of the output string
   # If the character is a space, add the word and a space
   output = words + (output == "" ? "" : " " + output)
   # Reset the word to an empty string
   words = ''
  else
    # If the character is not a space, add the word to the end of the word string
    words = words + char
  end
  # Increment the index to move to the next character
  index = index + 1
  # can be written as: index += 1
end


#Print the output string
puts output



# -----------------------------------------------------------------

# Basic String - Difference in string (Hamming)


# Given two strings of equal length, write a function that returns the number of characters that are different between the two strings.

# Input: "ABCDEFG", "ABCXEOG"
# Output: 2

# Explanation: While the A, B, C, E, and G are in the same place for both strings, they have different characters in the other spaces. Since there are 2 such spaces that are different (the D and F in the first string), we return 2.

# Input: "ABCDEFG", "ABCDEFG",
# Output: 0

string1 = "ABCDEFG"
string2 = "ABCXEOG"

#check if the strings are the same length
if string1.length != string2.length
  puts "Strings are not the same length"
else
  # Initialize a count variable
  count = 0
  index = 0

  # Iterate through the characters of the strings, comparing each character
  while index < string1.length
    if string1[index] != string2[index]
      count += 1
      # can be written as: count = count + 1
    end
    index += 1
    # can be written as: index = index + 1
  end

  puts count # => 2
end

# -----------------------------------------------------------------

# Basic String - Reverse Words (Palindrome)

# Given a string, write a function that returns true if it is a palindrome, and false if it is not. (A palindrome is a word that reads the same both forward and backward.)

# Input: “racecar”
# Output: true

# Input: “baloney”
# Output: false

input = "racecar"
x = 0
while input[x]
  x += 1
end

index = 0
palindrome = true

while index < x / 2
  if input[index] != input[x - index - 1]
    palindrome = false
    break
  end
  index = index + 1
  # can be written as: index += 1
end

puts palindrome # => true

# -----------------------------------------------------------------

# Basic String - First Duplicate Character

# Given a string, write a function that returns the first occurence of two duplicate characters in a row, and return the duplicated character.

# Input: “abcdefghhijkkloooop”
# Output: “h”

input = "abcdefghhijkklooooop"
output = ""
index = 0

while index < input.length - 1
  if input[index] == input[index + 1]
    output = input[index]
    break
  end
  index = index + 1
end
puts output

# -----------------------------------------------------------------

# Basic String - Alertnate Capitals

# Given a string, write a function that returns a copy of the original string that has every other character capitalized. (Capitalization should begin with the second character.)

#   Input: “hello, how are your porcupines today?”
#   Output: “hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?”

input = "hello, how are your porcupines today?"
output = ""

index = 0
while index < input.length
  if index % 2 == 1 && input[index] >= "a" && input[index] <= "z"
    output << (input[index].upcase)
  else
    output << input[index]
  end
  index = index + 1
  # can write as: index += 1
end

puts output # => "hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?"

# -----------------------------------------------------------------

# Basic String - Dollar Signs - Show me the money

# Given a string, write a function that returns true if the “$” character is contained within the string or false if it is not.

# Input: “i hate $ but i love money i know i know im crazy”
# Output: true

input = "i hate $ but i love money i know i know im crazy"
output = false
index = 0

while index < input.length
  if input[index] == "$"
    output = true
    break
  end
  index = index + 1
end
puts output
# -----------------------------------------------------------------
# Basic String - Reverse String - Start of Basic String Section

# Write a function that returns the reverse of a given string.

# Input: “abcde”
# Output: “edcba”

original_string = "abcde"
reversed_string = ""
index = 0

while index < original_string.length
  reversed_string = original_string[index] + reversed_string
  index += 1
  # can be written as: index = index + 1
end

puts reversed_string # => "edcba"


# -----------------------------------------------------------------

# Basic Array - Skip It - End of Basic Array Section

# Given an array of numbers, write a function that returns a new array in which only select numbers from the original array are included, based on the following details:

# The new array should always start with the first number from the original array. The next number that should be included depends on what the first number is. The first number dictates how many spaces to the right the computer should move to pick the next number. For example, if the first number is 2, then the next number that the computer should select would be two spaces to the right. This number gets added to the new array. If this next number happens to be a 4, then the next number after that is the one four spaces to the right. And so on and so forth until the end of the array is reached.

# Input:
# [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]

# Output:
# [2, 3, 1, 2, 2, 1, 5, 2, 2]

input = [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]
output = []
index = 0

while index < input.length
  output << input[index]
  index += input[index]
  # can be written as: index = index + input[index]
end

puts output # Output will be: [2, 3, 1, 2, 2, 1, 5, 2, 2]

# -----------------------------------------------------------------

# Basic Array - Reverse Array

# Given an array, write a function that returns an array that contains the original array’s values in reverse.

# Input: [1, 2, 3, 4, 5]
# Output: [5, 4, 3, 2, 1]

array = [1, 2, 3, 4, 5] # => [5, 4, 3, 2, 1]
new_array = []
index = 0

while index < array.length
  new_array << array[index]
  index = index + 1
  # could be written as: index += 1
end

puts new_array # => [5, 4, 3, 2, 1]

# -----------------------------------------------------------------

# Basic Array - Reduce Product

# Write a function that accepts an array of numbers and returns the product of all the numbers.

# Input: [1, 2, 3, 4]
# Output: 24

# Explanation: (1 x 2 x 3 x 4) = 24

numbers = [1, 2, 3, 4]
product = 1
index = 0

while index < numbers.length
  product = product * numbers[index]
  # Can be written as: product *= numbers[index]
  index = index + 1
  # can be written as: index += 1
end

puts product # => 24

# -----------------------------------------------------------------

# Basic array - Greatest number - Max

# Write a function that returns the greatest value from an array of numbers.

# Input: [5, 17, -4, 20, 12]
# Output: 20
array = [5, 17, -4, 20, 12]
greatest_number = array[0]

for number in array
  if number > greatest_number
    greatest_number = number
  end
end

p greatest_number

# -----------------------------------------------------------------

# Basic Array - Double It

# Given an array of numbers, write a function that returns a new array whose values are the original array’s value doubled.

# Input: [4, 2, 5, 99, -4]
# Output: [8, 4, 10, 198, -8]

numbers = [4, 2, 5, 99, -4]
new_numbers = []
index = 0
while index < numbers.length
  new_numbers << numbers[index] * 2

  index = index + 1
end
p new_numbers

# -------------------------------------------------------------------------------------

# Basic Array - Less Than 100

# Given an array of numbers, write a function that returns a new array that contains all numbers from the original array that are less than 100.

# Input: [99, 101, 88, 4, 2000, 50]
# Output: [99, 88, 4, 50]

input_numbers = [99, 101, 88, 4, 2000, 50]
new_numbers = []
index = 0
while index < input_numbers.length
  if input_numbers[index] < 100
    new_numbers << input_numbers[index]
  end
  index = index + 1
end
p new_numbers

# --------------------------------------------------

# Basic Array - Reduce sum

# Write a function that returns the sum of all numbers in a given array.

# NOTE: Do not use any built-in language functions that do this automatically for you.

# Input: [1, 2, 3, 4]
# Output: 10

# Explanation: (1 + 2 + 3 + 4) = 10

numbers = [1, 2, 3, 4]

sum = numbers[0]
index = 1
while index < numbers.length
  sum = sum + numbers[index]
  index = index + 1
end

p sum
