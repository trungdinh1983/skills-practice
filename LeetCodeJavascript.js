//# Problem -----------------------------------------------------------------

// # Solution =============================================




//# Problem -----------------------------------------------------------------

// # Solution =============================================




// # Problem -----------------------------------------------------------------


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


function runningSum(nums) {
  //Create an array to store the running sum values (typo: "tstore" to "store")
  let result = [];

  //Variable to keep track of the current sum (typo: "of." to "track of")
  let currentSum = 0;

  //loop through the input array
  for (let i = 0; i < nums.length; i++) {
    // Added the condition "i < nums.length" and fixed the extra space in "i ++" to "i++"
    //Add the current number to currentSum
    currentSum += nums[i];

    //Store the current running sum in the result array
    result[i] = currentSum;
  } // Added the closing brace for the for-loop

  //Return the result array containing all the running sums
  return result;
}

//Test the function
let nums = [1, 2, 3, 10];
let result = runningSum(nums);

// Print the result
console.log(result.join(" "));
