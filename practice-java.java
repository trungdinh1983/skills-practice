// Given a string, write a function that returns the first occurence of two duplicate characters in a row, and return the duplicated character.

// Input: “abcdefghhijkkloooop”
// Output: “h”

public class Main {
  public static void main(String[] args) {
      String input = "abcdefghhijkklooooop";
      String output = "";

      int index = 0;
      while (index < input.length() - 1) {
          if (input.charAt(index) == input.charAt(index + 1)) {
              output = String.valueOf(input.charAt(index));
              break;
          }
          index = index + 1;
      }

      System.out.println(output); // Output: "h"
  }
}
// The code uses the charAt method to access individual characters in the input string 




// # -----------------------------------------------------------------

// Given a string, write a function that returns a copy of the original string that has every other character capitalized. (Capitalization should begin with the second character.)

//   Input: “hello, how are your porcupines today?”
//   Output: “hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?”

  public class Main {
    public static void main(String[] args) {
      String input = "hello, how are your porcupines today?";
      StringBuilder output = new StringBuilder();

      int index = 0;
      while (index < input.length()) {
        if (index % 2 == 1 && input.charAt(index) >= 'a' && input.charAt(index) <= 'z') {
          output.append(Character.toUpperCase(input.charAt(index)));
        } else {
          output.append(input.charAt(index));
        }
        index = index + 1; // can be written as: index++
      }
      System.out.println(output.toString()); // Output: hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?
    }
  }

// # -----------------------------------------------------------------


// Given a string, write a function that returns true if the “$” character is contained within the string or false if it is not.

// Input: “i hate $ but i love money i know i know im crazy”
// Output: true

// Input: “abcdefghijklmnopqrstuvwxyz”
// Output: false



public class Main {
  public static void main(String[] args) {
      String input = "i hate $ but i love money i know i know im crazy";
      boolean output = false;
      int index = 0;

      while (index < input.length()) {
          if (input.charAt(index) == '$') {
              output = true;
              break;
          }
          index = index + 1;
      }

      System.out.println(output); // Output will be true
  }
}






// # -----------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array in which only select numbers from the original array are included, based on the following details:

// The new array should always start with the first number from the original array. The next number that should be included depends on what the first number is. The first number dictates how many spaces to the right the computer should move to pick the next number. For example, if the first number is 2, then the next number that the computer should select would be two spaces to the right. This number gets added to the new array. If this next number happens to be a 4, then the next number after that is the one four spaces to the right. And so on and so forth until the end of the array is reached.

// Input:
// [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]

// Output:
// [2, 3, 1, 2, 2, 1, 5, 2, 2]

public class Main {
  public static void main(String[] args) {
      int[] input = {2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2};
      int[] output = new int[input.length];
      int index = 0;
      int count = 0;

      while (index < input.length) {
          output[count] = input[index];
          index += input[index]; // can be written as: index = index + input[index]
          count++; // can be written as: count = count + 1
      }

      // If you need the exact result size, copy to a new array.
      int[] result = new int[count];
      System.arraycopy(output, 0, result, 0, count);

      for (int num : result) {
          System.out.print(num + " ");
      }
      // Output will be: 2 3 1 2 2 1 5 2 2
  }
}


// # -----------------------------------------------------------------




// Given an array, write a function that returns an array that contains the original array’s values in reverse.

// Input: [1, 2, 3, 4, 5]
// Output: [5, 4, 3, 2, 1]

// Must run with for class for online compiler:

public class Main {
  public static void main(String[] args) {


int[] array = {1, 2, 3, 4, 5};
    int[] newArray = new int[array.length];
    int index = 0;

    while (index < array.length) {
      newArray[array.length - index - 1] = array[index];
      index = index + 1;
    }

    // Printing the newArray
    for (int i = 0; i < newArray.length; i++) {
      System.out.print(newArray[i] + " ");
    }
    // Output: 5 4 3 2 1
  } 
} 


// # -----------------------------------------------------------------



// # Write a function that accepts an array of numbers and returns the product of all the numbers.

// # Input: [1, 2, 3, 4]
// # Output: 24

// # Explanation: (1 x 2 x 3 x 4) = 24

public class Main {
  public static void main (String[] args) {
    int[] numbers = { 1, 2, 3, 4 };
    int product = 1;

    for ( int i = 0; i < numbers.length; i++) {
      product = product * numbers[i];
    }
    System.out.println(product); // Output: 24
  }
}
// i++ is the same as i = i + 1
// i = index
// -----------------------------------------------------------------

// Write a function that returns the greatest value from an array of numbers.

// Input: [5, 17, -4, 20, 12]
// Output: 20

public class Main {
  public static void main(String[] args) {
      int[] array = {5, 17, -4, 20, 12};
      int greatest = array[0];

      for (int i = 0; i < array.length; i++) {
          if (array[i] > greatest) {
              greatest = array[i];
          }
      }

      System.out.println(greatest); // Output will be 20
  }
}





// -----------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array whose values are the original array’s value doubled.

// Input: [4, 2, 5, 99, -4]
// Output: [8, 4, 10, 198, -8]

public class Main {
  public static void main(String[] args) {
      int[] array = {4, 2, 5, 99, -4};
      int[] doubledArray = new int[array.length];
      int index = 0;

      while (index < array.length) {
          doubledArray[index] = array[index] * 2;
          index = index + 1;
      }

      for (int i = 0; i < doubledArray.length; i++) {
          System.out.print(doubledArray[i] + " ");
      }
      // Output will be 8 4 10 198 -8
  }
}
The output will be the doubled values of the original array: 8 4 10 198 -8.







// -------------------------------------------------------------------------------------

// Given an array of numbers, write a function that returns a new array that contains all numbers from the original array that are less than 100.

// Input: [99, 101, 88, 4, 2000, 50]
// Output: [99, 88, 4, 50]

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        int[] input_numbers = {99, 101, 88, 4, 2000, 50};
        ArrayList<Integer> new_numbers = new ArrayList<>();
        int index = 0;

        while (index < input_numbers.length) {
            if (input_numbers[index] < 100) {
                new_numbers.add(input_numbers[index]);
            }
            index = index + 1;
        }

        System.out.println(new_numbers); // Output will be [99, 88, 4, 50]
    }
}

// Or Use this if you don't want to use arraylist

public class Main {
  public static void main(String[] args) {
      int[] input_numbers = {99, 101, 88, 4, 2000, 50};
      int count = 0;

      // Count the numbers that are less than 100
      for (int number : input_numbers) {
          if (number < 100) {
              count++;
          }
      }

      // Create an array of the appropriate size
      int[] new_numbers = new int[count];
      int index = 0;
      int newIndex = 0;

      // Add numbers that are less than 100 to the new array
      while (index < input_numbers.length) {
          if (input_numbers[index] < 100) {
              new_numbers[newIndex++] = input_numbers[index];
          }
          index++;
      }

      // Print the new array
      for (int i = 0; i < new_numbers.length; i++) {
          System.out.print(new_numbers[i]);
          if (i < new_numbers.length - 1) {
              System.out.print(", ");
          }
      } // Output will be 99, 88, 4, 50
  }
}


// -------------------------------------------------------------------------------------

// Write a function that returns the sum of all numbers in a given array.

// NOTE: Do not use any built-in language functions that do this automatically for you.

// Input: [1, 2, 3, 4]
// Output: 10

// Explanation: (1 + 2 + 3 + 4) = 10

public class Main {
  public static void main(String[] args) {
      int[] numbers = {1, 2, 3, 4};
      int sum = numbers[0];
      int index = 1;

      while (index < numbers.length) {
          sum = sum + numbers[index];
          index = index + 1;
      }

      System.out.println(sum); // Output will be 10
  }
}
