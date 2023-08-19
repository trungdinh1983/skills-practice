Given two strings of equal length, write a function that returns the number of characters that are different between the two strings.

Input: "ABCDEFG", "ABCXEOG"
Output: 2

Explanation: While the A, B, C, E, and G are in the same place for both strings, they have different characters in the other spaces. Since there are 2 such spaces that are different (the D and F in the first string), we return 2.

Input: "ABCDEFG", "ABCDEFG",
Output: 0

# -----------------------------------------------------------------

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
