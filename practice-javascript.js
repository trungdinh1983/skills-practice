// Given an array of numbers, write a function that returns a new array that contains all numbers from the original array that are less than 100.

// Input: [99, 101, 88, 4, 2000, 50]
// Output: [99, 88, 4, 50]

const input_numbers = [99, 101, 88, 4, 2000, 50];
let new_numbers = [];
let index = 0;
while (index < input_numbers.length) {
  if (input_numbers[index] < 100) {
    new_numbers.push(input_numbers[index]);
  }
  index = index + 1;
}
console.log(new_numbers);

// -------------------------------------------------------------------------------------

// Write a function that returns the sum of all numbers in a given array.

// NOTE: Do not use any built-in language functions that do this automatically for you.

// Input: [1, 2, 3, 4]
// Output: 10

// Explanation: (1 + 2 + 3 + 4) = 10

const numbers = [1, 2, 3, 4];
let sum = numbers[0];
let index = 1;

while (index < numbers.length) {
  sum = sum + numbers[index];
  index = index + 1;
}

console.log(sum);
