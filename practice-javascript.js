// # Write a function that accepts an array of numbers and returns the product of all the numbers.

// # Input: [1, 2, 3, 4]
// # Output: 24

// # Explanation: (1 x 2 x 3 x 4) = 24

let array = [1, 2, 3, 4];
let product = 1;
let index = 0;

while (index < array.length) {
  product = product * array[index];
  // can be written product *= array[index];
  index = index + 1;
  // can be written index++;
  // can be written index += 1;
}

console.log(product); //output: 24
// note index can be shorted to i
// -------------------------------------------------------------------------------------

// Write a function that returns the greatest value from an array of numbers.

// Input: [5, 17, -4, 20, 12]
// Output: 20

var array = [5, 17, -4, 20, 12];
var greatest = array[0];

for (var i = 0; i < array.length; i++) {
  if (array[i] > greatest) {
    greatest = array[i];
  }
}

console.log(greatest);

// -----------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array whose values are the original array’s value doubled.

// Input: [4, 2, 5, 99, -4]
// Output: [8, 4, 10, 198, -8]

const input_numbers = [4, 2, 5, 99, -4];
let new_numbers = [];
let index = 0;
while (index < input_numbers.length) {
  new_numbers.push(input_numbers[index] * 2);
  index = index + 1;
}

console.log(new_numbers);

// -------------------------------------------------------------------------------------

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
