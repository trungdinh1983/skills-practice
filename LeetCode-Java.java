//# Problem -----------------------------------------------------------------

// # Solution =============================================

//# Problem -----------------------------------------------------------------

// # Solution =============================================

//# Problem -----------------------------------------------------------------

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

// # Solution =============================================

public class Solution {
  // This is a public method named 'runningSum' that takes an array of integers ('nums') as input.
// The method returns a new array of integers containing the running sum of the input array.
  public int[] runningSum(int[] nums) {
    // Create an array to store the running sum value
    int[] result = new int[nums.length];

    // Initialize a variable to keep track of the current sum
    int currentSum = 0;

    // Loop through the input array
    for (int i = 0; i < nums.length; i++) {
      // Add the current number to currentSum
      currentSum += nums[i];

      // Store the current running sum in the result array
      result[i] = currentSum;
    }

      // Return the result array containing all  the running sums
      return result;


    
  }

}

// Input: nums = [1,2,3,4]
// Output: [1,3,6,10]
// Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].


====================================================================================================
Complete solution in Java for main class

public class Solution {
  // This is a public method named 'runningSum' that takes an array of integers ('nums') as input.
  // The method returns a new array of integers containing the running sum of the input array.
  public int[] runningSum(int[] nums) {
      // Create an array to store the running sum value
      int[] result = new int[nums.length];

      // Initialize a variable to keep track of the current sum
      int currentSum = 0;

      // Loop through the input array
      for (int i = 0; i < nums.length; i++) {
          // Add the current number to currentSum
          currentSum += nums[i];

          // Store the current running sum in the result array
          result[i] = currentSum;
      }

      // Return the result array containing all the running sums
      return result;
  }

  // Main method to test runningSum
  public static void main(String[] args) {
      Solution sol = new Solution();  // Create an instance of the Solution class
      int[] nums = {1, 2, 3, 4};  // Test array
      int[] result = sol.runningSum(nums);  // Call the runningSum method

      // Print the result
      for (int num : result) {
          System.out.print(num + " ");
      }
  }
}
