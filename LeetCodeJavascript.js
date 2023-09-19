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
