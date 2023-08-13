// Write a function that returns the greatest value from an array of numbers.

// Input: [5, 17, -4, 20, 12]
// Output: 20

int[] array = { 5, 17, -4, 20, 12 };
int greatest = array[0];

for (int i = 0; i < array.length; i++) {
  if array[i] > greatest {
    greatest = array[i];
  }
}

System.out.printLn(greatest);
// -----------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array whose values are the original array’s value doubled.

// Input: [4, 2, 5, 99, -4]
// Output: [8, 4, 10, 198, -8]

int[] array = { 4, 2, 5, 99, -4};
int[] doubledarray = new int[array.length];
int index = 0;

while (index < array.length) {
  doubledarray[index] = array[index] * 2;
  index = index + 1;
}

for (int i = 0; i < doubledarray.length; i++) {
  System.out.print(doubledarray[i] + " ");
}


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
