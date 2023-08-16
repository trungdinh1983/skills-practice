
// Java needs a main method to run the code. The main method is the entry point of the program, and it is where the program starts execution. The main method must be declared public, static, and void. The main method's name must be main, and it must accept a String array as a parameter. The main method's body is enclosed in curly braces.

public class Main {
  public static void main(String[] args) {

// -------------------------------------------------------------------------------------


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


// -------------------------------------------------------------------------------------

// Working Solution in Java compiler

class Main {
  
  public static int[] doubleValues(int[] arr) {
    int[] doubledArray = new int[arr.length];
    
    for(int i = 0; i < arr.length; i++) {
      doubledArray[i] = arr[i] * 2;
    }
    
    return doubledArray;
  }

  public static void main(String[] args) {
    int[] inputArray = {4, 2, 5, 99, -4};
    int[] outputArray = doubleValues(inputArray);

    // Print the result
    for(int value : outputArray) {
      System.out.print(value + " ");
    }
  }
}
// Different online compilers might have varying expectations, and the code should be adjusted accordingly. If renaming the class to Main does not resolve the issue, please provide more details about the platform or the compiler you are using, and I'll do my best to assist you! This is the code that I used to test the solution.


// Please note code work on Compiler after changing the class name to Main




// -------------------------------------------------------------------------------------

class DoubleArrayValues {
  
  public static int[] doubleValues(int[] arr) {
    int[] doubledArray = new int[arr.length];
    
    for(int i = 0; i < arr.length; i++) {
      doubledArray[i] = arr[i] * 2;
    }
    
    return doubledArray;
  }

  public static void main(String[] args) {
    int[] inputArray = {4, 2, 5, 99, -4};
    int[] outputArray = doubleValues(inputArray);

    // Print the result
    for(int value : outputArray) {
      System.out.print(value + " ");
    }
  }
}