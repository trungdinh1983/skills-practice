//# Problem -----------------------------------------------------------------

// # Solution =============================================


//# Problem -----------------------------------------------------------------

1. Two Sum

Companies
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

 

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
 

Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.


// # Solution =============================================

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = []

  i = 0
  while i < nums.length
      j = i + 1
      while j < nums.length
          if nums[i] + nums[j] == target
              result = [i, j]
              break
          end
          j += 1
      end
      i += 1
  end

  return result
end

# Example usage:
nums = [2, 7, 11, 15]
target = 9
output = two_sum(nums, target)
puts "Output: #{output}"



# Problem -----------------------------------------------------------------


1480. Running Sum of 1d Array
Easy
7.3K
325
Companies
Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.

 

Example 1:

Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
Example 2:

Input: nums = [1,1,1,1,1]
Output: [1,2,3,4,5]
Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
Example 3:

Input: nums = [3,1,2,10,1]
Output: [3,4,6,16,17]
 

Constraints:

1 <= nums.length <= 1000
-10^6 <= nums[i] <= 10^6

# Solution =============================================

def running_sum(nums)
  # Create an array to store the running sum values  
  result = []

  # Variable to keep track of the current sum
  current_sum = 0

  # Variable to keep track of the current index
  i = 0  # Initialized variable i 
  
  # Loop through the input array using a while loop
  while i < nums.length
    # Add the current number to current_sum
    current_sum += nums[i]

    # Store the current running sum in the result array
    result[i] = current_sum

    # Increase the index by 1 for the next iteration
    i += 1  # i = i + 1
  end

  # Return the result array containing all the running sums
  result
end

# Test the function
nums = [1, 2, 3, 4]
result = running_sum(nums)

# Print the result
puts result.join(" ")
