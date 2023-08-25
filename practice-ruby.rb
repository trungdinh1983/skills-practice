
Basic Numbers - Sum of Multiples

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

# =============================================



# -----------------------------------------------------------------


Basic Numbers - Leap Year


Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

on every year that is evenly divisible by 4
except every year that is evenly divisible by 100
unless the year is also evenly divisible by 400
For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

If your language provides a method in the standard library that does this look-up, pretend it doesn't exist and implement it yourself.

# =============================================

year = 2000 # you can replace this with any year you want to check

if (year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0))
  puts "#{year} is a leap year"
else
  puts "#{year} is not a leap year"
end

# -----------------------------------------------------------------




# Basic Numbers - Fibonacci Numbers - sum of previous two numbers

Write a function that gives the Nth number of the Fibonacci Sequence. The Fibonacci sequence begins with 0 and 1, and every number thereafter is the sum of the previous two numbers. So the sequence goes like this:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, and so on until infinity...

Input: 9
Output: 21 (as this is the 9th number of the Fibonacci Sequence)


# =============================================

n = 0
a = 0
b = 1
counter = 3

if n == 1 
    puts a  
    elsif n == 2
        puts b
    else
      while counter <= n
          temp = a
          a = b
          b = temp + b
          counter += 1
      end
      puts b
  end

# -----------------------------------------------------------------

Basic Numbers - FIZZBUZZ - divisible by 3 and/or 5

Write a function that prints out every number from 1 to N, with the following exceptions:

If the number is divisible by 3, print out "FIZZ".
If the number is divisible by 5, print out "BUZZ".
If the number is divisible by both 3 and 5, print out "FIZZBUZZ".

# =============================================

N = 15
x = 1

while x <= N
  if x % 3 == 0  && x % 5 == 0
    puts "FIZZBUZZ"
  elsif x % 3 == 0
    puts "FIZZ"
  elsif x % 5 == 0
      puts "BUZZ"
  else
      puts x 
  end
  x = x + 1
  end

# -----------------------------------------------------------------

Basic numbers - Prime numbers - Start of Basic Numbers Section

Write a function that returns whether a given number is a prime number.

number = 7

prime = true  
if number < 2
  prime = false
else
  x = 2
  while x * x <= number
    if number % x == 0
      prime = false
      break
    end
    x = x + 1
    # can be written as: x += 1
  end
end

if prime
  puts "#{number} is prime"
else
  puts "#{number} is not prime"
end
# -----------------------------------------------------------------

# Basic String - Reverse Words - End of Basic String Section

Given a string of words, write a function that returns a new string that contains the words in reverse order.

Input: “popcorn is so cool isn’t it yeah i thought so”
Output: “so thought i yeah it isn’t cool so is popcorn”

#Assign the string to a variable
input = "popcorn is so cool isn't it yeah i thought so"
#initialize a new variable to store the reversed string
output = ''
#initialize a empty array to store the words
words = ''
#initialize a index variable to track the current word in the string
index = 0

# Continue looping until we reach the end of the string
while index < input.length
  # Get the character at the current index
  char = input[index]
  # Check if the character is a space or the last character in the string
  if char == " " || index == input.length - 1
   # Add the current word to the beginning of the output string
   # If the character is a space, add the word and a space
   output = words + (output == "" ? "" : " " + output)
   # Reset the word to an empty string
   words = ''
  else
    # If the character is not a space, add the word to the end of the word string
    words = words + char
  end
  # Increment the index to move to the next character
  index = index + 1
  # can be written as: index += 1
end


#Print the output string
puts output



# -----------------------------------------------------------------

# Basic String - Difference in string (Hamming)


# Given two strings of equal length, write a function that returns the number of characters that are different between the two strings.

# Input: "ABCDEFG", "ABCXEOG"
# Output: 2

# Explanation: While the A, B, C, E, and G are in the same place for both strings, they have different characters in the other spaces. Since there are 2 such spaces that are different (the D and F in the first string), we return 2.

# Input: "ABCDEFG", "ABCDEFG",
# Output: 0

string1 = "ABCDEFG"
string2 = "ABCXEOG"

#check if the strings are the same length
if string1.length != string2.length
  puts "Strings are not the same length"
else
  # Initialize a count variable
  count = 0
  index = 0

  # Iterate through the characters of the strings, comparing each character
  while index < string1.length
    if string1[index] != string2[index]
      count += 1
      # can be written as: count = count + 1
    end
    index += 1
    # can be written as: index = index + 1
  end

  puts count # => 2
end

# -----------------------------------------------------------------

# Basic String - Reverse Words (Palindrome)

# Given a string, write a function that returns true if it is a palindrome, and false if it is not. (A palindrome is a word that reads the same both forward and backward.)

# Input: “racecar”
# Output: true

# Input: “baloney”
# Output: false

input = "racecar"
x = 0
while input[x]
  x += 1
end

index = 0
palindrome = true

while index < x / 2
  if input[index] != input[x - index - 1]
    palindrome = false
    break
  end
  index = index + 1
  # can be written as: index += 1
end

puts palindrome # => true

# -----------------------------------------------------------------

# Basic String - First Duplicate Character

# Given a string, write a function that returns the first occurence of two duplicate characters in a row, and return the duplicated character.

# Input: “abcdefghhijkkloooop”
# Output: “h”

input = "abcdefghhijkklooooop"
output = ""
index = 0

while index < input.length - 1
  if input[index] == input[index + 1]
    output = input[index]
    break
  end
  index = index + 1
end
puts output

# -----------------------------------------------------------------

# Basic String - Alertnate Capitals

# Given a string, write a function that returns a copy of the original string that has every other character capitalized. (Capitalization should begin with the second character.)

#   Input: “hello, how are your porcupines today?”
#   Output: “hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?”

input = "hello, how are your porcupines today?"
output = ""

index = 0
while index < input.length
  if index % 2 == 1 && input[index] >= "a" && input[index] <= "z"
    output << (input[index].upcase)
  else
    output << input[index]
  end
  index = index + 1
  # can write as: index += 1
end

puts output # => "hElLo, HoW ArE YoUr pOrCuPiNeS ToDaY?"

# -----------------------------------------------------------------

# Basic String - Dollar Signs - Show me the money

# Given a string, write a function that returns true if the “$” character is contained within the string or false if it is not.

# Input: “i hate $ but i love money i know i know im crazy”
# Output: true

input = "i hate $ but i love money i know i know im crazy"
output = false
index = 0

while index < input.length
  if input[index] == "$"
    output = true
    break
  end
  index = index + 1
end
puts output
# -----------------------------------------------------------------
# Basic String - Reverse String - Start of Basic String Section

# Write a function that returns the reverse of a given string.

# Input: “abcde”
# Output: “edcba”

original_string = "abcde"
reversed_string = ""
index = 0

while index < original_string.length
  reversed_string = original_string[index] + reversed_string
  index += 1
  # can be written as: index = index + 1
end

puts reversed_string # => "edcba"


# -----------------------------------------------------------------

# Basic Array - Skip It - End of Basic Array Section

# Given an array of numbers, write a function that returns a new array in which only select numbers from the original array are included, based on the following details:

# The new array should always start with the first number from the original array. The next number that should be included depends on what the first number is. The first number dictates how many spaces to the right the computer should move to pick the next number. For example, if the first number is 2, then the next number that the computer should select would be two spaces to the right. This number gets added to the new array. If this next number happens to be a 4, then the next number after that is the one four spaces to the right. And so on and so forth until the end of the array is reached.

# Input:
# [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]

# Output:
# [2, 3, 1, 2, 2, 1, 5, 2, 2]

input = [2, 1, 3, 2, 5, 1, 2, 6, 2, 7, 1, 5, 6, 3, 2, 6, 2, 1, 2]
output = []
index = 0

while index < input.length
  output << input[index]
  index += input[index]
  # can be written as: index = index + input[index]
end

puts output # Output will be: [2, 3, 1, 2, 2, 1, 5, 2, 2]

# -----------------------------------------------------------------

# Basic Array - Reverse Array

# Given an array, write a function that returns an array that contains the original array’s values in reverse.

# Input: [1, 2, 3, 4, 5]
# Output: [5, 4, 3, 2, 1]

array = [1, 2, 3, 4, 5] # => [5, 4, 3, 2, 1]
new_array = []
index = 0

while index < array.length
  new_array << array[index]
  index = index + 1
  # could be written as: index += 1
end

puts new_array # => [5, 4, 3, 2, 1]

# -----------------------------------------------------------------

# Basic Array - Reduce Product

# Write a function that accepts an array of numbers and returns the product of all the numbers.

# Input: [1, 2, 3, 4]
# Output: 24

# Explanation: (1 x 2 x 3 x 4) = 24

numbers = [1, 2, 3, 4]
product = 1
index = 0

while index < numbers.length
  product = product * numbers[index]
  # Can be written as: product *= numbers[index]
  index = index + 1
  # can be written as: index += 1
end

puts product # => 24

# -----------------------------------------------------------------

# Basic array - Greatest number - Max

# Write a function that returns the greatest value from an array of numbers.

# Input: [5, 17, -4, 20, 12]
# Output: 20
array = [5, 17, -4, 20, 12]
greatest_number = array[0]

for number in array
  if number > greatest_number
    greatest_number = number
  end
end

p greatest_number

# -----------------------------------------------------------------

# Basic Array - Double It

# Given an array of numbers, write a function that returns a new array whose values are the original array’s value doubled.

# Input: [4, 2, 5, 99, -4]
# Output: [8, 4, 10, 198, -8]

numbers = [4, 2, 5, 99, -4]
new_numbers = []
index = 0
while index < numbers.length
  new_numbers << numbers[index] * 2

  index = index + 1
end
p new_numbers

# -------------------------------------------------------------------------------------

# Basic Array - Less Than 100

# Given an array of numbers, write a function that returns a new array that contains all numbers from the original array that are less than 100.

# Input: [99, 101, 88, 4, 2000, 50]
# Output: [99, 88, 4, 50]

input_numbers = [99, 101, 88, 4, 2000, 50]
new_numbers = []
index = 0
while index < input_numbers.length
  if input_numbers[index] < 100
    new_numbers << input_numbers[index]
  end
  index = index + 1
end
p new_numbers

# --------------------------------------------------

# Basic Array - Reduce sum

# Write a function that returns the sum of all numbers in a given array.

# NOTE: Do not use any built-in language functions that do this automatically for you.

# Input: [1, 2, 3, 4]
# Output: 10

# Explanation: (1 + 2 + 3 + 4) = 10

numbers = [1, 2, 3, 4]

sum = numbers[0]
index = 1
while index < numbers.length
  sum = sum + numbers[index]
  index = index + 1
end

p sum
