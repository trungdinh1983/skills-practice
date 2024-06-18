# Problem -----------------------------------------------------------------


# Solution =============================================



# Comment -----------------------------------------------------------------


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
