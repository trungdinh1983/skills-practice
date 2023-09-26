# Solution =============================================


 # Problem -----------------------------------------------------------------

 Basic Hash: Popular Post

 Description
Given an array of hashes that represent a list of social media posts, return a new array that only contains the posts that have at least 1000 likes.

Input: [
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]

Output: [
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
]





# Solution =============================================

# Given input
posts = [
  { title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644 }
]

# Initialize an empty array to store posts with at least 1000 likes
popular_posts = []

# Iterate through each post in the input array
posts.each do |post|
  # Check if the post has at least 1000 likes
  if post[:likes] >= 1000
    # If yes, add it to the popular_posts array
    popular_posts << post
  end
end

# Output the filtered array of popular posts
puts popular_posts


 # Problem -----------------------------------------------------------------

 Basic Hash: Menu Pair

 Given a hash, where the keys are strings representing food items, and the values are numbers representing the price of each food, return the amount someone would pay if they'd order one of each food from the entire menu.

 Input: {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
 
 Output: 14
 
 Explanation: If someone would order one of everything on the menu, they'd pay a total of 14 (the sum of all the hash's values).
 
 

#Solution =============================================

# Initialize variables
menu = {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
total_price = 0

# We need keys from the hash to loop through it
menu_keys = menu.keys

# Loop through the hash using while loop
i = 0

while i < menu_keys.length
    # Get the food item
    food_item = menu_keys[i]
    
    # Add its price to total_price
    total_price += menu[food_item]  # total_price = total_price + menu[food_item]
    
    # Move to the next food item in the hash
    i += 1  # same as i = i + 1
end

# Print the total_price
puts "Total price of one of everything: #{total_price}"  # Output should be 14




 # Problem -----------------------------------------------------------------

 Basic Hash: Count Words

Given an array of strings, return a hash that provides of a count of how many times each string occurs.

Input: ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"]

Output: {"Dewey" => 6, "Truman" => 5}

Explanation: "Dewey" occurs 6 times in the array, while "Truman" occurs 5 times.

# Solution =============================================

# Initialize variables
words_array = ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"]
word_count = {}

# Loop through the array
i = 0
while i < words_array.length
    word = words_array[i]
    
    # Check if the word is already in the hash
    if word_count [word]
        word_count[word] += 1 # Increment the count
    else
        word_count[word] = 1 # Initialize the count
    end
    
    # Move to the next word in the array
    i += 1 # Same as i = i + 1
end

# Print the result

puts "Word counts are: #{word_count}"  # Output: {"Dewey" => 6, "Truman" => 5}


 # Problem -----------------------------------------------------------------

 Basic Hash: Most Common Letter

 Given a string, find the most commonly occurring letter.

Input: “peter piper picked a peck of pickled peppers”
Output: “p”


 
# Solution =============================================

# Input String
input_str = "peter piper picked a peck of pickled peppers"

# Initialize variables
char_count = {}
most_common_char = nil
max_count = 0

# Loop through the characters in the input string using each_char
input_str.each_char do |char|
  next if char == ' '  # Skip empty space

  # Assign the current value if it exists, if not assign 0
  char_count[char] ||= 0
  char_count[char] += 1

  # Check if this character has the highest count currently
  if char_count[char] > max_count
    max_count = char_count[char]
    most_common_char = char
  end
end

# Print the most common letter
puts "Most common character is: '#{most_common_char}'"


 # Problem -----------------------------------------------------------------

Two Pointers - Longest Common Prefix

 Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z.

# Solution =============================================

def longest_common_prefix(strings)
  # Initialize variables
  return "" if strings.length == 0
  
  #Take the first string as a reference for the longest_common_prefix
  prefix = strings[0]
  i = 1
  
  # Loop through the other strings in the array
  while i < strings.length
      # REset j ofr each new string
      j = 0
      
      # Loop through characters of prefix and each string
      while j < prefix.length && j < strings[i].length
          # If characters don't match, break
          break if prefix[j] != strings[i][j]
          
          # Move to the next character in prefix and string
          j += 1
      end
          
          #update the prefix
          prefix = prefix[0, j]
          
          # If prefix has no length, no point in continuing
          return "" if prefix.length == 0
          
          # Move to the next string in the array
          i += 1
      end
      
      # Return the longest common prefix
      return prefix
  end
  
  # Test the function
  puts longest_common_prefix(["flower", "flow", "flight"])
  puts longest_common_prefix(["dog", "racecar", "car"])

 # Problem -----------------------------------------------------------------

# Two Pointers - 100 Coolio Array

 Use example structure below and using Ruby language solve  Given an array of numbers, return true if the array is a "100 Coolio Array", or false if it is not.

A "100 Coolio Array" meets the following criteria:

Its first and last numbers add up to 100,
Its second and second-to-last numbers add up to 100,
Its third and third-to-last numbers add up to 100,
and so on and so forth.

Here are examples of 100 Coolio Arrays:

[1, 2, 3, 97, 98, 99]
[90, 20, 70, 100, 30, 80, 10]




# Solution =============================================

# Initialize variables
num_array = [1, 2, 3, 97, 98, 99]
is_coolio = true # We'll assume it's a Coolio array until proven otherwise

# Initialize loop variables
i = 0
j = num_array.length - 1 # Start at the last element

# Loop through the array
while i < j
  # Check if the sum of the i-th and j-th elements is 100
  if num_array[i] + num_array[j] != 100
    is_coolio = false # Not a Coolio array
    break # No need to check further
  end
  
  # Move to the next pair of elements
  i += 1
  j -= 1
end

# Print the result
if is_coolio
  puts "Yep, it's a 100 Coolio Array!"
else
  puts "Nah, it's not a 100 Coolio Array."
end



 # Problem -----------------------------------------------------------------


Two Pointers - Merge Sorted Arrays

 Given two sorted arrays, merge the second array into the first array while ensuring that the first array remains sorted. Do not use any built-in sort methods.

 Input :
 A : [1, 5, 8]
 B : [6, 9]
 
 Modified A : [1, 5, 6, 8, 9]

 # Solution =============================================

 # Initialize variables
first_array = [1, 5, 8]
second_array = [6, 9]
result = []

# Pointers for first and second array
i = 0
j = 0

# Loop through both arrays
while i < first_array.length || j < second_array.length
  # Check the elements in both arrays and merge
  if i >= first_array.length
    result << second_array[j]
    j += 1
  elsif j >= second_array.length
    result << first_array[i]
    i += 1
  elsif first_array[i] < second_array[j]
    result << first_array[i]
    i += 1
  else
    result << second_array[j]
    j += 1
  end
end

# Print the result
puts "Merged and sorted array is: #{result}"


 # Problem -----------------------------------------------------------------


 Two Pointers - Two sums

 Given an array of numbers, return a new array containing just two numbers (from the original array) that add up to the number 10. If there are no two numbers that add up to 10, return false.

Specifically use nested loops to solve this exercise even though there are other approaches as well.

Input: [2, 5, 3, 1, 0, 7, 11]
Output: [3, 7]

Input: [1, 2, 3, 4, 5]
Output: false (While 1, 2, 3, and 4 altogether add up to 10, we're seeking just one pair of numbers.)


 # =============================================

 # Initialize variables
input_array = [2, 5, 3, 1, 0, 7, 11]
result = []

# Loop through the array
i = 0
while i < input_array.length
  j = i + 1 # Start j from the next element of i
  while j < input_array.length
    # Check if the numbers add up to 10
    if input_array[i] + input_array[j] == 10
      result << input_array[i]
      result << input_array[j]
      break # Exit the inner loop
    end
    j += 1 # Move to the next number in the array
  end
  break if result.length > 0 # Exit the outer loop if we found a pair
  i += 1 # Move to the next number in the array
end

# Print the result
if result.length > 0
  puts "The numbers are: #{result}"
else
  puts "No pair adds up to 10."
end


 # -----------------------------------------------------------------

 Two Pointers - Largest Product 

 Find the largest product of any two numbers within a given array.

Input: [5, -2, 1, -9, -7, 2, 6]
Output: 63 (-9 * -7)



 # =============================================
# Initialize variables
input_array = [5, -2, 1, -9, -7, 2, 6]
largest_product = input_array[0] * input_array[1] # Start with the product of the first two numbers

# Loop through the array
i = 0
j = 0

while i < input_array.length
  j = i + 1 # Start j from the next element of i
  while j < input_array.length
    # Calculate the product of the two numbers
    current_product = input_array[i] * input_array[j]
    
    # Check if this product is larger than the current largest_product
    if current_product > largest_product
      largest_product = current_product
    end
    
    # Move to the next number in the second loop
    j += 1 # can be written as: j = j + 1
  end
  
  # Move to the next number in the first loop
  i += 1 # can be written as: i = i + 1
end

# Print the largest product
puts "The largest product is: #{largest_product}" # Output should be 63 (-9 * -7)

NOTE: So, what this code does is it goes through each pair of numbers in the array and multiplies them. If the product is bigger than the current largest product, it updates the largest product. Finally, it prints out the largest product. Hope that helps!


 # -----------------------------------------------------------------

 Given ONE array of strings, return a new array that contains every combination of each string with every other string in the array.

Input: ["a", "b", "c", "d"]
Output: ["ab", "ac", "ad", "ba", "bc", "bd", "ca", "cb", "cd", "da", "db", "dc"]


 # =============================================




# Input array of strings
input_array = ["a", "b", "c", "d"]

# Initialize variables
result = []
i = 0

# Loop through the array
while i < input_array.length
    j = 0 # Reset j for each new i
    while j < input_array.length
        # Skip if it's the same index
        if i != j
            # Combine strings from the array
            combo = input_array[i] + input_array[j]
            
            # Add the combo to the result array
            result << combo
            
            # Move to the next string
            j += 1
        else
            j += 1
        end
    end
    
    # Move to the next string
    i += 1
end

# Print the result
puts "Combinations are: #{result}"


 # -----------------------------------------------------------------


Two Pointers Array Mesh I

Given two arrays of strings, return a new string that contains every combination of a string from the first array concatenated with a string from the second array.

Input: ["a", "b", "c"], ["d", "e", "f", "g"]
Output: ["ad", "ae", "af", "ag", "bd", "be", "bf", "bg", "cd", "ce", "cf", "cg"]

 # =============================================

# Initalize variables
first_array = ["a", "b", "c"]
second_array = ["d", "e", "f", "g"]
result = []

# Loop through both arrays
i = 0
j = 0

while i < first_array.length
    j = 0 # Reset j for each new i
    while j < second_array.length
        #Combine strings from both arrays
        combo = first_array[i] + second_array[j]
        
        #Add the combo to the result array
        result << combo # same as result.push(combo)
        
        #Move to the next string in the second array
        j += 1 # can be written j = j + 1
    end
        
        #Move to the next string in the first array
        i += 1 # can be written i = i + 1
    end
    
    #Print the result
    puts "Combinations are: #{result}" # Result # ["ad", "ae", "af", "ag", "bd", "be", "bf", "bg", "cd", "ce", "cf", "cg"]

 # -----------------------------------------------------------------

Basic Numbers - Largest Palindrome Product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

 # =============================================


 #Initialize variable
largest_palindrome = 0
i = 100
j = 100

# Loop until both i and j reach 100
while i <= 999 && j <= 999
    # Calculate the product
    product = i * j
    str_product = product.to_s
    is_palindrom = true
    
    # Manually check if it's a palindrom
    len = str_product.length
    half_len = len / 2
    index = 0
    
    while index < half_len
        if str_product[index] != str_product[len - index - 1]
            is_palindrome = false
            break
        end
        index += 1
    end
    
    # Update largest_palindrome if its a palindrom is bigger 
    if is_palindrom && product > largest_palindrome
        largest_palindrome = product
    end
    
    # Update i and j
    
    if j < 999
        j += 1
    else
        i += 1
        j = 100
    end
end

puts "The largest palindrom made from the product of two 3-digit numbers is #{largest_palindrome}" // 906609
    

# -----------------------------------------------------------------


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

# =============================================

n = 12 # you can replace this with any number you want to check
steps = 0

while n != 1
  if n % 2 == 0
    n = n / 2
  else
    n =3 * n + 1
  end
  steps += 1 # can be written as: steps = steps + 1
end

puts "It took #{steps} steps to reach 1"


# -----------------------------------------------------------------

Basic Numbers - Sum of Multiples

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.


# =============================================

sum = 0
num = 1

while num < 1000
  if num % 3 == 0 || num % 5 == 0
    sum += num
  end
  num += 1
end

puts "The sum of all multiples of 3 or 5 below 1000 is #{sum}"

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
