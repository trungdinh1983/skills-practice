



// # =============================================


// # -----------------------------------------------------------------


Two Pointers Array Mesh I

Given two arrays of strings, return a new string that contains every combination of a string from the first array concatenated with a string from the second array.

Input: ["a", "b", "c"], ["d", "e", "f", "g"]
Output: ["ad", "ae", "af", "ag", "bd", "be", "bf", "bg", "cd", "ce", "cf", "cg"]

// # =============================================

// Initialize variables
const firstArray = ["a", "b", "c"]
const secondArray = ["d", "e", "f", "g"]
let result = [];

//Loop through both arrays
let i = 0;
let j = 0;

while (i < firstArray.length) {
    j = 0; // Reset j for each new i
    while (j < secondArray.length) {
        // Combine strings from both arrays
        const combo = firstArray[i] + secondArray[j];
        
        //Add the combo to the result array
        result[result.length] = combo;
        
        //Move to the next string in the second array
        j++; // same as j = j + 1
    }
    
    // Move to the next string in the first array
    i++; // same as i = i + 1;
}

//Print the result
console.log("Combinations are:", result);

// # -----------------------------------------------------------------

Basic Numbers - Largest Palindrome Product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

// # =============================================

// Initialize variables
let largestPalindrome = 0;
let i = 100;
let j = 100;

// Loop until both i and j reach 999
while (i <= 999 && j <= 999) {
  // Calculate the product
  let product = i * j;
  let strProduct = product.toString();
  let isPalindrome = true;

  // Manually check if it's a palindrome
  let len = strProduct.length;
  let halfLen = Math.floor(len / 2); // Math.floor used to round number
  let index = 0;

  while (index < halfLen) {
    if (strProduct[index] !== strProduct[len - index - 1]) {
      isPalindrome = false;
      break;
    }
    index++; // can be written as index = index + 1
  }

  // Update largestPalindrome if it's a palindrome and bigger
  if (isPalindrome && product > largestPalindrome) {
    largestPalindrome = product;
  }

  // Update i and j
  if (j < 999) {
    j++;
  } else {
    i++;
    j = 100;
  }
}

console.log(`The largest palindrome made from the product of two 3-digit numbers is ${largestPalindrome}`);  // Output: 906609

// # -----------------------------------------------------------------

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

// # =============================================

let n = 12; // Change this number to test
let steps = 0

while (n !== 1) {
  if (n % 2 === 0) {
    n = n / 2
  } else {
    n = 3 * n + 1;
  }
  steps++; // can be written as: steps = steps + 1 or steps += 1
  }
console.log('The number of steps required to reach 1 is ' + steps);



// # -----------------------------------------------------------------


Basic Numbers - Sum of Multiples

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.


// # =============================================

let sum = 0;
let num = 1;

while (num < 1000) {
  if (num % 3 === 0 || num % 5 === 0) {
    sum += num; // sum = sum + num;
  }
  num++;
}

console.log(`The sum of all multiples of 3 or 5 below 1000 is ${sum}`);


// # -----------------------------------------------------------------

Basic Numbers - Leap Year


Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

on every year that is evenly divisible by 4
except every year that is evenly divisible by 100
unless the year is also evenly divisible by 400
For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

If your language provides a method in the standard library that does this look-up, pretend it doesn't exist and implement it yourself.

# =============================================

var year = 2000; // you can replace this with any year you want to check

if ((year % 400 === 0) || ((year % 100 !== 0) && (year % 4 === 0))) {
  console.log(year + " is a leap year");
} else {
  console.log(year + " is not a leap year");
}

# -----------------------------------------------------------------


# Basic Numbers - Fibonacci Numbers - sum of previous two numbers

Write a function that gives the Nth number of the Fibonacci Sequence. The Fibonacci sequence begins with 0 and 1, and every number thereafter is the sum of the previous two numbers. So the sequence goes like this:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, and so on until infinity...

Input: 9
Output: 21 (as this is the 9th number of the Fibonacci Sequence)


// # =============================================

var n = 9;
var a = 0;
var b = 1;
var counter = 3;

if (n === 1) {
    console.log(a);
} else if (n === 2) {
    console.log(b);
} else {
    while (counter <= n) {
        var temp = a;
        a = b;
        b = temp + b;
        counter += 1;
    }
    console.log(b);
}
    

// # -----------------------------------------------------------------


Basic Numbers - FIZZBUZZ - divisible by 3 and/or 5

Write a function that prints out every number from 1 to N, with the following exceptions:

If the number is divisible by 3, print out "FIZZ".
If the number is divisible by 5, print out "BUZZ".
If the number is divisible by both 3 and 5, print out "FIZZBUZZ".

// =============================================

var N = 15; // Change this number to test
var x = 1;

while (x <= N) { 
if (x % 3 === 0 && x % 5 === 0) { 
    console.log("FIZZBUZZ");
} else if ( x % 3 === 0) {
    console.log("FIZZ");
} else if ( x % 5 === 0) {
    console.log("BUZZ");
} else {
    console.log(x);
    }
    x = x + 1;
    }

// # -----------------------------------------------------------------

Basic numbers - Prime numbers - Start of Basic Numbers Section

Write a function that returns whether a given number is a prime number.

var number = 7; // Change this number to test
var prime = true;
if (number === 1) {
  prime = false;
} else {
  var x = 2;
  while (x * x <= number) {
    if (number % x === 0) {
      prime = false;
      break;
    }
    x = x + 1;
  }
}

if (prime) {
  console.log(number + " is prime");
} else {
  console.log(number + " is not prime");
}


// # -----------------------------------------------------------------

// #Basic String - Reverse Words - End of Basic String section

// Given a string of words, write a function that returns a new string that contains the words in reverse order.

// Input: “popcorn is so cool isn’t it yeah i thought so”
// Output: “so thought i yeah it isn’t cool so is popcorn”

// Assign the input string to a variable
const input = "popcorn is so cool isn't it yeah i thought so";
// Initialize an empty string variable
let output = "";
// initialize an empty string to store current word
let words = "";
// initialize an index variable
let index = 0;

// Continue looping until the end of the string
while (index < input.length) {
  // Get character at current index
  let char = input[index];
  // check if the character is a space or the last character in the string
  if (char === " " || index === input.length - 1) {
    // if the character ise last one and not a space , add it to the current word
    if (index === input.length - 1 && char !== " ") words += char;
    // add the current word to beginning of the output string
    // If the output string is not empty, add a space before the current word
    output = words + (output === "" ? "" : " ") + output;
    // reset the word to an empty string
    words = "";
  } else {
    // If the character is not a space, add it to the current word string
    words += char;
    //can be written as: words = words + char;
  }
  // increment the index
  index++;
  // can be written as: index = index + 1; or index += 1;
}

// Output the result
console.log(output);

// # -----------------------------------------------------------------

// Basic String - Difference in Length (Hamming)

// Given two strings of equal length, write a function that returns the number of characters that are different between the two strings.

// Input: "ABCDEFG", "ABCXEOG"
// Output: 2

// Explanation: While the A, B, C, E, and G are in the same place for both strings, they have different characters in the other spaces. Since there are 2 such spaces that are different (the D and F in the first string), we return 2.

// Input: "ABCDEFG", "ABCDEFG",
// Output: 0

var string1 = "ABCDEFG";
var string2 = "ABCXEOG";

// check if the strings are the same length
if (string1.length !== string2.length) {
  console.log("Strings are not the same length");
} else {
  // Initialize a counter variable
  var counter = 0;
  var index = 0;

  // Loop through the strings
  while (index < string1.length) {
    // Compare the characters at the current index
    if (string1[index] !== string2[index]) {
      // Increment the counter if they don't match
      counter = counter + 1;
      // can be written as: counter += 1; or counter++;
    }
    index = index + 1;
    // can be written as: index += 1; or index++;
  }
  console.log(counter); // Output will be 2
}

// # -----------------------------------------------------------------

// Basic String - Reading Reverse (palindrome)

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

// Basic String - First Duplicate Character

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

// Basic String  - Capitalize

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

// Basic Array - Show me the money

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

// Basic String - Reverse String - beginning of Basic String section

// Write a function that returns the reverse of a given string.

// Input: “abcde”
// Output: “edcba”

var input = "abcde";
var output = "";
var index = 0;
// can be written as: var index = input.length - 1;

while (index < input.length) {
  output = input[index] + output;
  index = index + 1;
  // can be written as: index++;
}

console.log(output); // Output will be: edcba

// -----------------------------------------------------------------

// Basic Array - Skip It - End of Basic Array section

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

// Basic Array Reverse Array

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

// Basic Array Reduce Product

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

// Basic Array Greatest Number - Max

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

// -------------------------------------------------------------------------------------

// Basic Array - Double

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

// Basic Array - Less Than 100

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

// Basic Array - Sum - Start of Basic Array section

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
