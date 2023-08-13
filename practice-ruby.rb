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

# numbers = [1, 2, 3, 4]

# sum = numbers[0]
# index = 1
# while index < numbers.length
#   sum = sum + numbers[index]
#   index = index + 1
# end

# p sum
