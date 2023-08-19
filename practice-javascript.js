Given two strings of equal length, write a function that returns the number of characters that are different between the two strings.

Input: "ABCDEFG", "ABCXEOG"
Output: 2

Explanation: While the A, B, C, E, and G are in the same place for both strings, they have different characters in the other spaces. Since there are 2 such spaces that are different (the D and F in the first string), we return 2.

Input: "ABCDEFG", "ABCDEFG",
Output: 0

// # -----------------------------------------------------------------

// Given a string, write a function that returns true if it is a palindrome, and false if it is not. (A palindrome is a word that reads the same both forward and backward.)

// Input: “racecar”
// Output: true

// Input: “baloney”
// Output: false

var input = "racecar";
var x = 0;

while (input[x]) {
  // Fixed the missing parenthesis
  x = x + 1; // can be written as: x += 1; or x++;
}

var index = 0;
var palindrome = true;

while (index < x / 2) {
  if (input[index] !== input[x - 1 - index]) {
    palindrome = false;
    break;
  }
  index = index + 1; // can be written as: index += 1; or index++;
}

console.log(palindrome); // Output will be true

// # -----------------------------------------------------------------

// Given a string, write a function that returns the first occurence of two duplicate characters in a row, and return the duplicated character.

// Input: “abcdefghhijkkloooop”
// Output: “h”

var input = "abcdefghhijkkloooooop";
var output = "";
var index = 0;

while (index < input.lenth - 1) {
  if (inout[index] === input[index + 1]) {
    output = input[index];
    break;
  }
  index = index + 1;
}

console.log(output); //Output will be "h"
// # -----------------------------------------------------------------

// Given a string, write a function that returns a copy of the original string that has every other character capitalized. (Capitalization should begin with the second character.)

//   Input: “hello, how are your porcupines today?”
//   Output: “hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?”

var input = "hello, how are your porcupines today?";
var output = "";

var index = 0;
while (index < input.length) {
  if (index % 2 === 1 && input[index] <= "z") {
    output = output + input[index].toUpperCase();
  } else {
    output = output + input[index];
  }
  index = index + 1;
  // can be written as: index++;
}

console.log(output); // Output can be written: hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?

// # -----------------------------------------------------------------

// Given a string, write a function that returns true if the “$” character is contained within the string or false if it is not.

// Input: “i hate $ but i love money i know i know im crazy”
// Output: true

var input = "i hate $ but i love money i know i know im crazy";
var output = false;
var index = 0;

while (index < input.length) {
  if (input[index] === "$") {
    output = true;
    break;
  }
  index = index + 1;
}

console.log(output); // Output will be true

// # -----------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array in which only select numbers from the original array are included, based on the following details:

// The new array should always start with the first number from the original array. The next number that should be included depends on what the first number is. The first number dictates how many spaces to the right the computer should move to pick the next number. For example, if the first number is 2, then the next number that the computer should select would be two spaces to the right. This number gets added to the new array. If this next number happens to be a 4, then the next number after that is the one four spaces to the right. And so on and so forth until the end of the array is reached.

// Input:
// [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]

// Output:
// [2, 3, 1, 2, 2, 1, 5, 2, 2]

const input = [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2];
const output = [];
let index = 0;

while (index < input.length) {
  output.push(input[index]);
  index += input[index];
  // can be written as: index = index + input[index]
}

console.log(output); // Output will be: [2, 3, 1, 2, 2, 1, 5, 2, 2]

// # -----------------------------------------------------------------

// Given an array, write a function that returns an array that contains the original array’s values in reverse.

// Input: [1, 2, 3, 4, 5]
// Output: [5, 4, 3, 2, 1]

var array = [1, 2, 3, 4, 5];
var newArray = [];
var index = 0;

while (index < array.length) {
  newArray[array.length - 1 - index] = array[index];
  index = index + 1;
}

console.log(newArray); // => [5, 4, 3, 2, 1]

// # -----------------------------------------------------------------

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
