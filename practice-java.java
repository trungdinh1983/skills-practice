//# Problem -----------------------------------------------------------------

// # Solution =============================================

// # Problem -----------------------------------------------------------------

Basic Hash:Count Words

Given an array of strings,return a hash that provides of a count of how many times each string occurs.

Input:["Dewey","Truman","Dewey","Dewey","Truman","Truman","Dewey","Truman","Truman","Dewey","Dewey"]

Output:{"Dewey"=>6,"Truman"=>5}

Explanation:"Dewey"occurs 6 times in the array,while"Truman"occurs 5 times.

// # Solution =============================================

//# Problem -----------------------------------------------------------------

Basic Hash:Most Common Letter

Given a string,find the most commonly occurring letter.

Input:“peter piper picked a peck of pickled peppers”Output:“p”

// # Solution =============================================

public class Main {
  public static void main(String[] args) {
    // Input String
    String inputStr = "peter piper picked a peck of pickled peppers";

    // Initiatize variables
    char[] characters = new char[256]; // Store unique characters(Not Use)
    int[] counts = new int[256]; // Store counts of characters
    char mostCommonChar = ' ';
    int maxCount = 0;

    // Loop through the characters in the input string
    for (int i = 0; i < inputStr.length(); i++) {
      char currentChar = inputStr.charAt(i); // Get the current chracter at position i

      if (currentChar == ' ') {
        continue; // Skip empty space
      }

      char lowerChar = Character.toLowerCase(currentChar); // Convert the character to lowercase

      // Increase the count for this character
      counts[lowerChar]++;

      // Check if this character has the highest count currently
      if (counts[lowerChar] > maxCount) {
        maxCount = counts[lowerChar];
        mostCommonChar = lowerChar;
      }
    }

    // Print the most common letter
    System.out.println("Most common character is: '" + mostCommonChar + "'");
  }}

  // # Problem -----------------------------------------------------------------

  Two Pointers-
  Longest Common
  Prefix

 Write
  a function
  to find
  the longest
  common prefix
  string amongst
  an array
  of strings.

  If there
  is no
  common prefix,return
  an empty string"".

  Example 1:

  Input:["flower","flow","flight"]Output:"fl"Example 2:

  Input:["dog","racecar","car"]Output:""Explanation:
  There is
  no common
  prefix among
  the input strings.Note:

All given
  inputs are
  in lowercase
  letters a-z.

  // # Solution =============================================

  public class Main {
    public static void main(String[] args) {
      System.out.println(longestCommonPrefix(new String[] { "flower", "flow", "flight" })); // Should be "fl"
      System.out.println(longestCommonPrefix(new String[] { "dog", "racecar", "car" })); // Should be ""
    }

    public static String longestCommonPrefix(String[] strings) {
      // If there's nothing in the array, just return an empty string
      if (strings.length == 0)
        return "";

      // Start with the first string in the array as a reference
      String refString = strings[0];

      // An array to hold the prefix
      char[] newPrefix = new char[refString.length()];
      // Initialize newPrefixLength with refString.length()
      int newPrefixLength = refString.length();

      for (int i = 1; i < strings.length; i++) {
        int j = 0;
        int tempLength = 0;

        // Loop through and compare each char
        while (j < newPrefixLength && j < refString.length() && j < strings[i].length()) {
          // If the letters don't match, time to break
          if (refString.charAt(j) != strings[i].charAt(j))
            break;
          newPrefix[tempLength] = refString.charAt(j);

          // Move on. to the next letter
          j++;
          // Increment tempLength
          tempLength++;
        }

        // update the prefic with only the matching part
        newPrefixLength = tempLength;

        // If prefix is empty, no common prefix
        if (newPrefixLength == 0)
          return "";
      }

      // Convert the array to a string manually
      return new String(newPrefix, 0, newPrefixLength);
    }
  }

  // # Problem -----------------------------------------------------------------

  #

  Two Pointers-100
  Coolio Array

 Use example
  structure below
  and using
  Ruby language
  solve Given
  an array
  of numbers,return true if
  the array
  is a"100 Coolio Array",or false if
  it is not.

  A"100 Coolio Array"
  meets the
  following criteria:

Its first
  and last
  numbers add
  up to 100,
Its second
  and second-to-last numbers
  add up to 100,
Its third
  and third-to-last numbers
  add up to 100,
and so
  on and
  so forth.

Here are
  examples of 100
  Coolio Arrays:

  [1,2,3,97,98,99][90,20,70,100,30,80,10]

  // Solution =============================================

  public class Main {
    public static void main(String[] arg) {
      // Intialize variables
      int[] numArray = { 1, 2, 3, 97, 98, 99 };
      boolean isCoolio = true; // We'll assume it's a Coolio array until prvoen otherwise

      // Initialize loop variables
      int i = 0; // Start with first variable
      int j = numArray.length - 1; // Start with last variable

      // Loop. through the array
      while (i < j) {
        // Check if the sum of i and j is less than 100 than Coolio Array is false
        if (numArray[i] + numArray[j] != 100) {
          isCoolio = false; // Not Coolio array
          break; // No need to check further
        }
        // Move to the next pair of elements
        i++; // i = i + 1
        j--; // j = j - 1
      }
      // Print the result
      if (isCoolio) {
        System.out.println(" Yep, it's 100 coolio array");
      } else {
        System.out.println("Nah, its's not a 100 Coolio Array");
      }
    }
  }

  // # -----------------------------------------------------------------

  Two Pointers
  Array Mesh
  I

Given
  two arrays
  of strings,return a new
  string that
  contains every
  combination of
  a string
  from the
  first array
  concatenated with
  a string
  from the
  second array.

  Input:["a","b","c"],["d","e","f","g"]Output:["ad","ae","af","ag","bd","be","bf","bg","cd","ce","cf","cg"]

  // # =============================================

  class Main {
    public static void main(String[] args) {

      // Initialize variables
      String[] firstArray = { "a", "b", "c" };
      String[] secondArray = { "d", "e", "f", "g" };
      String[] result = new String[firstArray.length * secondArray.length];

      // Loop through both arrays
      int i = 0;
      int j = 0;
      int k = 0; // index for result array

      while (i < firstArray.length) {
        j = 0; // REset j for each new i
        while (j < secondArray.length) {
          // Combine strings from both arrays
          String combo = firstArray[i] + secondArray[j];

          // Add the comb to the result array
          result[k] = combo; // This line replaces the .add() in ArrayList
          k++; // Move to the next position in the result array

          // Move to the next string in the second array
          j++; // same as j = j + 1
        }

        // Move to the next string in the first array
        i++; // same as i = i + 1;
      }
      System.out.print("Combinations are: ");
      for (String s : result) {
        System.out.print(s + " ");
      }
    }

    // # -----------------------------------------------------------------

    Basic Numbers-
    Largest Palindrome
    Product

A
  palindromic number
    reads the
    same both
    ways.The largest
    palindrome made
    from the
    product of two 2-
    digit numbers is 9009=91×99.

    Find the
    largest palindrome
    made from
    the product
    of two 3-
    digit numbers.

    // # =============================================

    public class Main {
      public static void main(String[] args) {
        // Initiaze variables
        int largestPalindrome = 0;
        int i = 100;
        int j = 100;

        // Loop until both i and j reach 999
        while (i <= 999 && j <= 999) {
          // Calculate the product
          int product = i * j;
          String strProduct = Integer.toString(product);
          boolean isPalindrome = true;

          // Manually check if it's a palindrome
          int len = strProduct.length();
          int halfLen = len / 2;
          int index = 0;

          while (index < halfLen) {
            if (strProduct.charAt(index) != strProduct.charAt(len - index - 1)) {
              isPalindrome = false;
              break;
            }
            index++;
          }
          // Update largestPalindrome if it's a palindrome is bigger
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
        System.out
            .println("The largest palindrome made from the product of two 3-digit numbers is " + largestPalindrome);
      }
    }

    // # -----------------------------------------------------------------

    Basic Numbers-
    Collatz Conjecture

    The Collatz
    Conjecture or 3 x+1
    problem can
    be summarized
    as follows:

    Take any
    positive integer
    n.If n
    is even, divide
    n by 2
    to get n/2.
    If n
    is odd, multiply
    n by 3
    and add 1
    to get 3 n+1.
    Repeat the
    process indefinitely.
    The conjecture
    states that
    no matter
    which number
    you start with,
    you will
    always reach 1
    eventually.

        Given a
    number n,return
    the number
    of steps
    required to reach 1.

    Examples Starting
    with n = 12, the
    steps would
    be as follows:

    12 6 3 10 5 16 8 4 2 1

    Resulting in 9 steps.So for
    input n = 12, the return
    value would be 9.

    // # =============================================

    public class Main {
      public static void main(String[] args) {
        int n = 12; // Change this number to test
        int steps = 0; // Initialize steps to 0

        while (n != 1) {
          if (n % 2 == 0) {
            n = n / 2;
          } else {
            n = n * 3 + 1;
          }
          steps++; // Increment steps by 1; can be written: steps = steps + 1 or steps += 1
        }
        System.out.println("It took " + steps + " steps to reach 1"); // Output: It took 9 steps to reach 1
      }
    }

    // # -----------------------------------------------------------------

    Basic Numbers-
    Leap Year

    Given a year,report if
    it is
    a leap
    year.Basic Numbers-
    Sum of
    Multiples

    If
    we list
    all the
    natural numbers below 10
    that are
    multiples of 3 or 5,
    we get 3,5,6 and 9.
    The sum
    of these
    multiples is 23.

    Find the
    sum of
    all the
    multiples of 3 or 5 below 1000.

    // # =============================================

    public class Main {
      public static void main(String[] args) {
        int sum = 0;
        int num = 1;

        while (num < 1000) {
          if (num % 3 == 0 || num % 5 == 0) {
            sum += num;
          }
          num++;
        }

        System.out.println("The sum of all multiples of 3 or 5 below 1000 is " + sum);
      }
    }

    // # -----------------------------------------------------------------

    The tricky
    thing here
    is that
    a leap
    year in
    the Gregorian
    calendar occurs:

    on every
    year that
    is evenly
    divisible by 4
    except every
    year that
    is evenly
    divisible by 100
    unless the
    year is
    also evenly
    divisible by 400
    For example,1997
    is not
    a leap year,but 1996 is.1900
    is not
    a leap year,but 2000
    is.

        If your
    language provides
    a method
    in the
    standard library
    that does this look-up,
    pretend it doesn't
    exist and
    implement it yourself.

    #=============================================

    public class LeapYear {
      public static void main(String[] args) {
        int year = 2000; // you can replace this with any year you want to check

        if ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0))) {
          System.out.println(year + " is a leap year");
        } else {
          System.out.println(year + " is not a leap year");
        }
      }
    }

    #-----------------------------------------------------------------

    Write a
    function that
    gives the
    Nth number
    of the
    Fibonacci Sequence.
    The Fibonacci
    sequence begins with 0 and 1,
    and every
    number thereafter
    is the
    sum of
    the previous
    two numbers.
    So the
    sequence goes like this:

    0,1,1,2,3,5,8,13,21,34,55,
    and so
    on until infinity...

    Input:9 Output:21(as this
    is the 9
    th number
    of the
    Fibonacci Sequence)

    Basic Numbers-FIZZBUZZ-
    divisible by 3 and/or 5

    #
    Basic Numbers-
    Fibonacci Numbers-
    sum of
    previous two
    numbers

    Write
    a function
    that gives
    the Nth
    number of
    the Fibonacci
    Sequence.The Fibonacci
    sequence begins with 0 and 1,
    and every
    number thereafter
    is the
    sum of
    the previous
    two numbers.
    So the
    sequence goes like this:

    0,1,1,2,3,5,8,13,21,34,55,
    and so
    on until infinity...

    Input:9 Output:21(as this
    is the 9
    th number
    of the
    Fibonacci Sequence)

    // # =============================================

    public class Fibonacci {
      public static void main(String[] args) {
        int n = 9;
        int a = 0;
        int b = 1;
        int counter = 3;

        if (n == 1) {
          System.out.println(a);
        } else if (n == 2) {
          System.out.println(b);
        } else {
          while (counter <= n) {
            int temp = a;
            a = b;
            b = temp + b;
            counter += 1;
          }
          System.out.println(b);
        }
      }
    }

    // # -----------------------------------------------------------------

    Write a
    function that
    prints out
    every number from 1
    to N, with
    the following exceptions:

    If the
    number is
    divisible by 3,
    print out"FIZZ".
    If the
    number is
    divisible by 5,
    print out"BUZZ".
    If the
    number is
    divisible by both 3 and 5,
    print out"FIZZBUZZ".

    // =============================================

    public class FizzBuzz {
      public static void main(String[] args) {
        int N = 15; // Change number to test
        int x = 1;

        while (x <= N) {
          if (x % 3 == 0 && x % 5 == 0) {
            System.out.println("FIZZBUZZ");
          } else if (x % 3 == 0) {
            System.out.println("FIZZ");
          } else if (x % 5 == 0) {
            System.out.println("BUZZ");
          } else {
            System.out.println(x);
          }
          x = x + 1;
        }
      }
    }

    // # -----------------------------------------------------------------

    Basic numbers-
    Prime numbers-
    Start of
    Basic Numbers
    Section

    Write
    a function
    that returns
    whether a
    given number
    is a
    prime number.

    public class PrimeCheck {
      public static void main(String[] args) {
        int number = 7; // Change this number to test
        boolean isPrime = true;

        if (number == 1) {
          isPrime = false;
        } else {
          int i = 2;
          while (i * i <= number) {
            if (number % i == 0) {
              isPrime = false;
              break;
            }
            i++; // can be written as: i = i + 1 or i += 1
          }
        }
        if (isPrime) {
          System.out.println(number + " is a prime number");
        } else {
          System.out.println(number + " is not a prime number");
        }
      }

    }

    // # -----------------------------------------------------------------

    // #Basic String - Reverse Words - End of Basic String section

    Given a
    string of words,
    write a
    function that
    returns a new
    string that
    contains the
    words in
    reverse order.

    Input:“
    popcorn is
    so cool isn’
    t it
    yeah i
    thought so”Output:“
    so thought
    i yeah
    it isn’
    t cool
    so is popcorn”

    public class ReverseWords {
      public static void main(String[] args) {
        // Assign the input string to a variable
        String input = "popcorn is so cool isn't it yeah i thought so";
        // Initialize an empty string variable
        StringBuilder output = new StringBuilder();
        // Initialize and empty string to hold the current word
        StringBuilder currentWord = new StringBuilder();
        // Initialize an index variable to 0;
        int index = 0;

        // Continue looping until the index is equal to the length of the input string
        while (index < input.length()) {
          // Get the character at the current index
          char currentCharacter = input.charAt(index);
          // Check if the character is a space or the last character in the string
          if (currentCharacter == ' ' || index == input.length() - 1) {
            // If the character is the last one and not a space, add it to the current word
            // string
            if (index == input.length() - 1 && currentCharacter != ' ')
              currentWord.append(currentCharacter);
            // Add the current word to the beginning of the output string
            // If the output string is not empty, add a space before the current word
            output.insert(0, currentWord + (output.length() == 0 ? "" : " "));
            // Reset the current word to an empty string
            currentWord = new StringBuilder();
          } else {
            // If the character is not a space, add it to the current word string
            currentWord.append(currentCharacter);
          }
          // Increment the index
          index++; // can be written as: index = index + 1, or index += 1
        }
        // Print the output string
        System.out.println(output.toString()); // Output: so thought i yeah it isn't cool so is popcorn
      }
    }

    // # -----------------------------------------------------------------

    // Basic String - Difference in string length (Hamming)

    // Given two strings of equal length, write a function that returns the number
    // of characters that are different between the two strings.

    // Input: "ABCDEFG", "ABCXEOG"
    // Output: 2

    // Explanation: While the A, B, C, E, and G are in the same place for both
    // strings, they have different characters in the other spaces. Since there are
    // 2 such spaces that are different (the D and F in the first string), we return
    // 2.

    // Input: "ABCDEFG", "ABCDEFG",
    // Output: 0

    public class Main {
      public static void main(String[] args) {
        String input1 = "ABCDEFG";
        String input2 = "ABCXEOG";

        // Check
        if (input1.length() != input2.length()) {
          System.out.println("Strings are not the same length");
        } else {
          // Initialize a counter variable
          int counter = 0;
          int index = 0;

          // Loop through the strings
          while (index < input1.length()) {
            // Compare the characters at the current index
            if (input1.charAt(index) != input2.charAt(index)) {
              // Increment the counter if they are different
              counter++;
              // can be written as: counter = counter + 1
            }
            index++;
            // can be written as: index = index + 1
          }
          System.out.println(counter); // Output: 2
        }
      }
    }

    // # -----------------------------------------------------------------

    // Basic String - Palindrome - Read the same forward and backward

    // Given a string, write a function that returns true if it is a palindrome, and
    // false if it is not. (A palindrome is a word that reads the same both forward
    // and backward.)

    // Input: “racecar”
    // Output: true

    // Input: “baloney”
    // Output: false

    public class Main {
      public static void main(String[] args) {
        String input = "racecar";
        int x = 0;

        while (x < input.length()) {
          x++; // can be written as: x = x + 1
        }

        int index = 0;
        boolean palindrome = true;

        while (index < x / 2) {
          if (input.charAt(index) != input.charAt(x - 1 - index)) {
            palindrome = false;
            break;
          }
          index = index + 1; // can be written as: index++
        }
        System.out.println(palindrome); // Output: true
      }
    }

    // # -----------------------------------------------------------------

    // Basic String - First Duplicate Character

    // Given a string, write a function that returns the first occurence of two
    // duplicate characters in a row, and return the duplicated character.

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
    // The code uses the charAt method to access individual characters in the input
    // string

    // # -----------------------------------------------------------------

    // Basic String - Capitalize Every Other Letter - Aternate Capitalization

    // Given a string, write a function that returns a copy of the original string
    // that has every other character capitalized. (Capitalization should begin with
    // the second character.)

    // Input: “hello, how are your porcupines today?”
    // Output: “hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?”

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

    // Basic String - Dollar Sign - Show me the money

    // Given a string, write a function that returns true if the “$” character is
    // contained within the string or false if it is not.

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

    // Basic String - Reverse String - Start of basic string section

    // Write a function that returns the reverse of a given string.

    // Input: “abcde”
    // Output: “edcba”

    public class ReverseString {
      public static void main(String[] args) {
        String originalString = "abcde";
        String reversedString = "";
        int index = 0;
        // can be written as: index = index + 1
        while (index < originalString.length()) {
          reversedString = originalString.charAt(index) +
              reversedString;
          index++;
          // can be written as: index = index + 1 or index += 1
        }
        System.out.println(reversedString); // Output: edcba
      }
    }

    // # -----------------------------------------------------------------

    Basic Array
    Skip IT-
    End of
    Basic Array section

    // Given an array of numbers, write a function that returns a new array in which
    // only select numbers from the original array are included, based on the
    // following details:

    // The new array should always start with the first number from the original
    // array. The next number that should be included depends on what the first
    // number is. The first number dictates how many spaces to the right the
    // computer should move to pick the next number. For example, if the first
    // number is 2, then the next number that the computer should select would be
    // two spaces to the right. This number gets added to the new array. If this
    // next number happens to be a 4, then the next number after that is the one
    // four spaces to the right. And so on and so forth until the end of the array
    // is reached.

    // Input:
    // [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]

    // Output:
    // [2, 3, 1, 2, 2, 1, 5, 2, 2]

    public class Main {
      public static void main(String[] args) {
        int[] input = { 2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2 };
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

    Basic Array Reverse

    // Given an array, write a function that returns an array that contains the
    // original array’s values in reverse.

    // Input: [1, 2, 3, 4, 5]
    // Output: [5, 4, 3, 2, 1]

    // Must run with for class for online compiler:

    public class Main {
      public static void main(String[] args) {

        int[] array = { 1, 2, 3, 4, 5 };
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

    Basic Array
    Reduce an
    Product array

    // # Write a function that accepts an array of numbers and returns the product
    // of all the numbers.

    // # Input: [1, 2, 3, 4]
    // # Output: 24

    // # Explanation: (1 x 2 x 3 x 4) = 24

    public class Main {
      public static void main(String[] args) {
        int[] numbers = { 1, 2, 3, 4 };
        int product = 1;

        for (int i = 0; i < numbers.length; i++) {
          product = product * numbers[i];
        }
        System.out.println(product); // Output: 24
      }
    }
    // i++ is the same as i = i + 1
    // i = index
    // -----------------------------------------------------------------

    Basic Array MAX

    // Write a function that returns the greatest value from an array of numbers.

    // Input: [5, 17, -4, 20, 12]
    // Output: 20

    public class Main {
      public static void main(String[] args) {
        int[] array = { 5, 17, -4, 20, 12 };
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

    Basic array Map:Double

    // Given an array of numbers, write a function that returns a new array whose
    // values are the original array’s value doubled.

    // Input: [4, 2, 5, 99, -4]
    // Output: [8, 4, 10, 198, -8]

    public class Main {
      public static void main(String[] args) {
        int[] array = { 4, 2, 5, 99, -4 };
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

The output
will be
the doubled
values of
the original array:8 4 10 198-8.

// -------------------------------------------------------------------------------------

Basic array-
Less than 100

// Given an array of numbers, write a function that returns a new array that
// contains all numbers from the original array that are less than 100.

// Input: [99, 101, 88, 4, 2000, 50]
// Output: [99, 88, 4, 50]

import java.util.ArrayList;

public class Main {
  public static void main(String[] args) {
    int[] input_numbers = { 99, 101, 88, 4, 2000, 50 };
    ArrayList<Integer> new_numbers = new ArrayList<>();
    int index = 0;

    while (index < input_numbers.length) {
      if (input_numbers[index] < 100) {
        new_numbers.add(input_numbers[index]);
      }
      index = index + 1;
    }

    System.out.println(new_numbers); // Output will be [99, 88, 4, 50]
  }}

  Or Use this if
  you dont
  want to
  use arraylist

  public class Main {
    public static void main(String[] args) {
      int[] input_numbers = { 99, 101, 88, 4, 2000, 50 };
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

  // Basic Array - Reduce Sum

  // Write a function that returns the sum of all numbers in a given array.

  // NOTE: Do not use any built-in language functions that do this automatically
  // for you.

  // Input: [1, 2, 3, 4]
  // Output: 10

  // Explanation: (1 + 2 + 3 + 4) = 10

  public class Main {
    public static void main(String[] args) {
      int[] numbers = { 1, 2, 3, 4 };
      int sum = numbers[0];
      int index = 1;

      while (index < numbers.length) {
        sum = sum + numbers[index];
        index = index + 1;
      }

      System.out.println(sum); // Output will be 10
    }
}
