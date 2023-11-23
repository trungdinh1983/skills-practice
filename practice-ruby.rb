                  
# Problem -----------------------------------------------------------------



# Solution =============================================

    
                  
# Problem -----------------------------------------------------------------

Proverb

Instructions
For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"], you will output the full text of this proverbial rhyme:

For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.


# Solution =============================================

# Initialize the array with your items
items = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]

# This will store the lines of the proverb
proverb = []

# Loop through the items array
i = 0
while i < items.length - 1
    # Construct each line of the proverb
    line = "For want of a #{items[i]} the #{items[i + 1]} was lost."
    
    # Add the line to the proverb array
    proverb << line
    
    # Move to the next item
    i += 1
end

# Add the final line to the proverb
proverb << "And all for the want of a #{items[0]}."

# Print the proverb
puts proverb.join("\n")
  

             
# Problem -----------------------------------------------------------------


Brute to Linear: ETL #4

This is very similar to ETL #3, but you must now accomplish the task in linear time (O(N)).

Given an array of Youtube videos, for example:

[
{title: 'How to Make Wood', author_id: 4, views: 6},
{title: 'How to Seem Perfect', author_id: 4, views: 111},
{title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
{title: 'Why Pigs Stink', author_id: 1, views: 12}
]

and an array of authors, for example:

[
{id: 1, first_name: 'Jazz', last_name: 'Callahan'},
{id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
{id: 3, first_name: 'Saron', last_name: 'Kim'},
{id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

Return a new array of videos in the following format, and only include videos that have at least 100 views:

[
{title: 'How to Seem Perfect', views: 111, author_name: 'Teena Burgess' }
{title: 'Review of the New "Unbreakable Mug"', views: 202, author_name: 'Ichabod Loadbearer' },
]

# Solution =============================================

  # Initialize the arrays
videos = [
  {title: 'How to Make Wood', author_id: 4, views: 6},
  {title: 'How to Seem Perfect', author_id: 4, views: 111},
  {title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
  {title: 'Why Pigs Stink', author_id: 1, views: 12}
]

authors = [
  {id: 1, first_name: 'Jazz', last_name: 'Callahan'},
  {id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
  {id: 3, first_name: 'Saron', last_name: 'Kim'},
  {id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

# Prepare the result array
result = []

# Loop through the videos array
i = 0
while i < videos.length
  video = videos[i]

  # Check if the video has at least 100 views
  if video[:views] >= 100
    # Find the author of the video
    j = 0
    while j < authors.length
      author = authors[j]

      # Check if the author's id matches the video's author_id
      if author[:id] == video[:author_id]
        # Combine the video and author information
        video_info = {
          title: video[:title],
          views: video[:views],
          author_name: "#{author[:first_name]} #{author[:last_name]}"
        }

        # Add the combined information to the result array
        result << video_info
        break # Exit the inner loop once the author is found
      end

      j += 1
    end
  end

  i += 1
end

# Print the result
puts "Filtered videos are: #{result}"
  

             
# Problem -----------------------------------------------------------------


Brute to Linear: Two Sum II

This is the same exercise as Two Sum I, but you must now solve it in linear time.

Given an array of numbers, return a new array containing just two numbers (from the original array) that add up to the number 10. If there are no two numbers that add up to 10, return false.

Input: [2, 5, 3, 1, 0, 7, 11]
Output: [3, 7]

Input: [1, 2, 3, 4, 5]
Output: false (While 1, 2, 3, and 4 altogether add up to 10, we're seeking just one pair of numbers.)

# Solution =============================================

# Function to find two numbers that add up to 10
def find_two_sum(numbers)
    # Initialize variables
    i = 0
    j = 0

    # Loop through the array with two pointers
    while i < numbers.length
        j = i + 1 # Start j from the next element of i
        while j < numbers.length
            # Check if the sum of numbers at i and j is 10
            if numbers[i] + numbers[j] == 10
                # Return the pair if the sum is 10
                return [numbers[i], numbers[j]]
            end
            j += 1 # Move to the next element in the array
        end
        i += 1 # Move to the next element in the array
    end

    # Return false if no pair adds up to 10
    false
end

# Test the function with your examples
puts "Output: #{find_two_sum([2, 5, 3, 1, 0, 7, 11])}" # Should output [3, 7]
puts "Output: #{find_two_sum([1, 2, 3, 4, 5])}"       # Should output false


       
# Problem -----------------------------------------------------------------


 Brute to Linear: First Unique Character

 Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Examples:

s = "leetcode"
return 0.
(The "l" is the first character that only appears once in the string, and appears at index 0.)

s = "loveleetcode",
return 2.
(The "l" and "o" are repeated, so the first non-repeating character is the "v", which is at index 2.)

Note: You may assume the string contain only lowercase letters.

# Solution =============================================

def first_uniq_char(s)
  # Initialize variables
  char_count = Hash.new(0) # Hash to store character counts
  char_order = []          # Array to store the order of characters

  # First loop: Count characters and store their order
  i = 0
  while i < s.length
      char = s[i]
      char_count[char] += 1
      char_order << char unless char_count[char] > 1
      i += 1
  end

  # Second loop: Find the first unique character
  j = 0
  while j < char_order.length
      return s.index(char_order[j]) if char_count[char_order[j]] == 1
      j += 1
  end

  # If no unique character found, return -1
  -1
end

# Test the function
puts first_uniq_char("leetcode")      # Output: 0
puts first_uniq_char("loveleetcode")  # Output: 2


  

# Problem -----------------------------------------------------------------

From Brute to Linear: Missing Letter

A given string contains all the letters from the alphabet except for one. Return the missing letter.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: “The quick brown box jumps over a lazy dog”
Output: “f”

# Solution =============================================

# Initialize variables
input_string = "The quick brown box jumps over a lazy dog"
alphabet = ("a".."z").to_a
result = nil

# Convert input string to downcase and split into an array of characters
input_array = input_string.downcase.chars

# Sort the array to ensure the order (not necessary if input is already sorted)
input_array.sort!

# Loop through the alphabet
i = 0
j = 0

while i < alphabet.length
  # Check if the current letter in the alphabet is in the input array
  if j < input_array.length && alphabet[i] == input_array[j]
    # If it is, move to the next letter in the input array
    j += 1
  else
    # If it isn't, we've found our missing letter
    result = alphabet[i]
    break # Exit the loop since we found the missing letter
  end

  # Move to the next letter in the alphabet
  i += 1
end

# Print the result
puts "The missing letter is: #{result}"
  

# Problem -----------------------------------------------------------------

From Brute to Linear: Array Duplicate

A given array has one pair of duplicate values. Return the first duplicate value.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [5, 2, 9, 7, 2, 6]
Output: 2


# Solution =============================================

# Initialize variables
input_array = [5, 2, 9, 7, 2, 6]
seen_numbers = {}
first_duplicate = nil

# Loop through the array
i = 0

while i < input_array.length
  # Check if the number is already in the hash
  if seen_numbers[input_array[i]]
    first_duplicate = input_array[i]
    break
  else
    # Add the number to the hash
    seen_numbers[input_array[i]] = true
  end
  
  # Move to the next number in the array
  i += 1
end

# Print the first duplicate
if first_duplicate
  puts "First duplicate is: #{first_duplicate}" # Output: 2
else
  puts "No duplicates found."
end


# Problem -----------------------------------------------------------------

From Brute to Linear: Array Subset

Given two arrays, determine whether one is a subset of the other. It is considered a subset if all the values in one array are contained within the other.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5, 6], [6, 3, 2]
Output: true

Input: [1, 2, 3, 4, 5, 6], [6, 3, 7]
Output: false

# Solution =============================================

    # Initialize variables
first_array = [1, 2, 3, 4, 5, 6]
second_array = [6, 3, 2]
result = true

# Create a hash to store the elements of the first array
hash_map = {}

# Loop through the first array to populate the hash
i = 0
while i < first_array.length
  hash_map[first_array[i]] = true
  i += 1
end

# Loop through the second array to check if each element exists in the hash
j = 0
while j < second_array.length
  unless hash_map[second_array[j]]
    result = false
    break
  end
  j += 1
end

# Print the result
puts "Is the second array a subset of the first? #{result}"

     
   
# Problem -----------------------------------------------------------------


From Brute to Linear: Array Intersection

Given two arrays, return a new array that contains the intersection of the two arrays. The intersection means the values that are contained in both of the arrays. Do not use the "&", or any built-in intersection methods.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5], [1, 3, 5, 7, 9]
Output: [1, 3, 5]



# Solution =============================================

   # Initialize variables
first_array = [1, 2, 3, 4, 5]
second_array = [1, 3, 5, 7, 9]
result = []

# Create a hash to store elements of the first array
hash_map = {}
i = 0
while i < first_array.length
  hash_map[first_array[i]] = true
  i += 1
end

# Loop through the second array to find common elements
j = 0
while j < second_array.length
  # Check if the element exists in the hash
  if hash_map[second_array[j]]
    result << second_array[j] # Add to the result array
  end
  j += 1
end

# Print the result
puts "Intersection is: #{result}" # Output should be [1, 3, 5]
 
     
        
        
# Problem -----------------------------------------------------------------

#Data Transformation: ETL #3

Given an array of Youtube videos, for example:

[
{title: 'How to Make Wood', author_id: 4, views: 6},
{title: 'How to Seem Perfect', author_id: 4, views: 111},
{title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202},
{title: 'Why Pigs Stink', author_id: 1, views: 12}
]

and an array of authors, for example:

[
{id: 1, first_name: 'Jazz', last_name: 'Callahan'},
{id: 2, first_name: 'Ichabod', last_name: 'Loadbearer'},
{id: 3, first_name: 'Saron', last_name: 'Kim'},
{id: 4, first_name: 'Teena', last_name: 'Burgess'},
]

Return a new array of videos in the following format, and only include videos that have at least 100 views:

[
{title: 'How to Seem Perfect', views: 111, author_name: 'Teena Burgess' }
{title: 'Review of the New "Unbreakable Mug"', views: 202, author_name: 'Ichabod Loadbearer' },
]



# Solution =============================================

# Given data
videos = [
  { title: 'How to Make Wood', author_id: 4, views: 6 },
  { title: 'How to Seem Perfect', author_id: 4, views: 111 },
  { title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202 },
  { title: 'Why Pigs Stink', author_id: 1, views: 12 }
]

authors = [
  { id: 1, first_name: 'Jazz', last_name: 'Callahan' },
  { id: 2, first_name: 'Ichabod', last_name: 'Loadbearer' },
  { id: 3, first_name: 'Saron', last_name: 'Kim' },
  { id: 4, first_name: 'Teena', last_name: 'Burgess' }
]

# Initialize variables
i = 0
result = []

# Loop through the videos array
while i < videos.length
  video = videos[i]

  # Check if the video has at least 100 views
  if video[:views] >= 100

    # Find the author associated with the video
    author = authors.find { |author| author[:id] == video[:author_id] }

    # Create the author's full name
    author_name = "#{author[:first_name]} #{author[:last_name]}"

    # Create a formatted video hash
    formatted_video = {
      title: video[:title],
      views: video[:views],
      author_name: author_name
    }

    # Add the formatted video to the result array
    result << formatted_video
  end

  # Move to the next video in the loop
  i += 1
end

# Print the result
puts "Filtered and formatted videos:"
puts result
    


# Problem -----------------------------------------------------------------

        Data Transformation: Book Organizer

        Given a list of books provided in this format:
        
        [
        {title: "The Lord of the Rings", author: "J. R. R. Tolkien", year: 1954 },
        {title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960 },
        {title: "1984", author: "George Orwell", year: 1949 },
        {title: "Go Set a Watchman", author: "Harper Lee", year: 2015 },
        {title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937 },
        {title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925 },
        {title: "The Two Towers", author: "J. R. R. Tolkien", year: 1954 }
        ]
        
        return the data in this new author-centric format:
        
        { "J. R. R. Tolkien" => [
        {title: "The Lord of the Rings", year: 1954 },
        {title: "The Hobbit", year: 1937 },
        {title: "The Two Towers", year: 1954 }
        ],
        "Harper Lee" => [
        {title: "To Kill a Mockingbird", year: 1960 },
        {title: "Go Set a Watchman", year: 2015 }
        ],
        "George Orwell" => [
        {title: "1984", year: 1949 }
        ],
        "F. Scott Fitzgerald" => [
        {title: "The Great Gatsby", year: 1925 }
        ]
        }


# Solution =============================================

    # Given list of books
books = [
  {title: "The Lord of the Rings", author: "J. R. R. Tolkien", year: 1954 },
  {title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960 },
  {title: "1984", author: "George Orwell", year: 1949 },
  {title: "Go Set a Watchman", author: "Harper Lee", year: 2015 },
  {title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937 },
  {title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925 },
  {title: "The Two Towers", author: "J. R. R. Tolkien", year: 1954 }
]

# Initialize a hash to store author-centric data
author_centric = {}

# Initialize variables for the loop
i = 0
while i < books.length
  book = books[i]
  author = book[:author]
  
  # Create a new entry for the author if it doesn't exist
  author_centric[author] ||= []

  # Add book information to the author's entry
  author_centric[author] << {title: book[:title], year: book[:year]}

  # Move to the next book
  i += 1
end

# Print the author-centric data
puts author_centric


        # Problem -----------------------------------------------------------------

Data Transformation: Complete the Data II

Given an array of social media posts and an array of users, return a list of posts (as an array of hashes) that replaces the submitted_by id number as the person's actual name.

For example, given this array of posts (note that the submitted_by is an id number):

[
{title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
{title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
{title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

And this array of users:

[
{user_id: 403, name: "Aunty Em"},
{user_id: 231, name: "Joelle P."},
{user_id: 989, name: "Lyndon Johnson"},
{user_id: 111, name: "Patti Q."},
]

Return the array of posts as follows:

[
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]



#Solution =============================================

#Given array of posts
posts = [
  { title: 'Me Eating Pizza', submitted_by: 231, likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: 111, likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: 403, likes: 644 }
]

#Given array of users
users = [
  { user_id: 403, name: "Aunty Em" },
  { user_id: 231, name: "Joelle P." },
  { user_id: 989, name: "Lyndon Johnson" },
  { user_id: 111, name: "Patti Q." }
]

#Initialize an empty result array
result = []

#Loop through posts
i = 0
while i < posts.length
  post = posts[i]
  user_id = post[:submitted_by]

  # Find the user with the matching user_id
  j = 0
  while j < users.length
    user = users[j]
    if user[:user_id] == user_id
      # Replace the user_id with the user's name
      post[:submitted_by] = user[:name]
      break # No need to continue searching for this post
    end
    j += 1
  end

  # Add the modified post to the result array
  result << post

  i += 1
end

# Print the result
result.each do |post|
  puts post
end

    
    
    # Problem -----------------------------------------------------------------

Data transformation: ETL #2

    You are given a hash in format #A, and you are to return the same data as a hash using format #B, as specified below:

    Input:
    
    {
    1 => ["A", "E", "I", "O", "U"]
    }
    
    Output:
    
    {
    'a' => 1,
    'e' => 1,
    'i' => 1,
    'o' => 1,
    'u' => 1
    }
    Input:
    
    {
    1 => ["A", "E"],
    2 => ["D", "G"]
    }
    
    Output:
    
    {
    'a' => 1,
    'd' => 2,
    'e' => 1,
    'g' => 2
    }
    
    Input:
    
    {
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
    }
    
    Output:
    
    {
    'a' => 1,
    'b' => 3,
    'c' => 3,
    'd' => 2,
    'e' => 1,
    'f' => 4,
    'g' => 2,
    'h' => 4,
    'i' => 1,
    'j' => 8,
    'k' => 5,
    'l' => 1,
    'm' => 3,
    'n' => 1,
    'o' => 1,
    'p' => 3,
    'q' => 10,
    'r' => 1,
    's' => 1,
    't' => 1,
    'u' => 1,
    'v' => 4,
    'w' => 4,
    'x' => 8,
    'y' => 4,
    'z' => 10
    }

# Solution =============================================

# Initialize variables
input_hash = {
  1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2 => ["D", "G"],
  3 => ["B", "C", "M", "P"],
  4 => ["F", "H", "V", "W", "Y"],
  5 => ["K"],
  8 => ["J", "X"],
  10 => ["Q", "Z"]
}

output_hash = {}

# Loop through the input hash
i = 0
keys = input_hash.keys
while i < keys.length
  key = keys[i]
  value_array = input_hash[key]
  
  j = 0
  while j < value_array.length
    # Convert each letter to lowercase and add to output hash
    letter = value_array[j].downcase
    output_hash[letter] = key
    
    # Move to the next letter in the value array
    j += 1
  end
  
  # Move to the next key in the input hash
  i += 1
end

# Print the result
puts "Transformed hash is: #{output_hash}"

  
  # Problem -----------------------------------------------------------------

  Data Transformation: Flip Hash

  Given a hash, create a new hash that has the keys and values switched.

Input: {"a" => 1, "b" => 2, "c" => 3}
Output: {1 => "a", 2 => "b", 3 => "c"}




# Solution =============================================

# Initialize variables
original_hash = {"a" => 1, "b" => 2, "c" => 3}
keys = original_hash.keys
values = original_hash.values
new_hash = {}

# Initialize loop variables
i = 0

# Loop through the original hash
while i < keys.length
  # Switch keys and values
  new_key = values[i]
  new_value = keys[i]
  
  # Add the switched key-value pair to the new hash
  new_hash[new_key] = new_value
  
  # Move to the next key-value pair in the original hash
  i += 1 # same as i = i + 1
end

# Print the new hash
puts "The new hash is: #{new_hash}" # Output: {1 => "a", 2 => "b", 3 => "c"}


  # Problem -----------------------------------------------------------------

  Data Transformation: Flatten Hash

  Given a hash, return a flat array containing all the hash’s keys and values.
  
  Input: {“a” => 1, “b” => 2, “c” => 3, “d” => 4}
  Output: [“a”, 1, “b”, 2, “c”, 3, “d”, 4]
  

# Solution =============================================

# Initialize variables
input_hash = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
output_array = []

# Get keys and values arrays from the hash
keys_array = input_hash.keys
values_array = input_hash.values

# Initialize loop variables
i = 0

# Loop through the hash
while i < keys_array.length
  # Add the key to the output array
  output_array << keys_array[i]
  
  # Add the value to the output array
  output_array << values_array[i]
  
  # Move to the next key-value pair in the hash
  i += 1
end

# Print the result
puts "Flattened array is: #{output_array}"

#Flattened array is: ["a", 1, "b", 2, "c", 3, "d", 4]


# Problem -----------------------------------------------------------------

Basic Hash: Anagrams

Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

Do not use any built-in sort methods.

Input: “silent”, “listen”
Output: true

Input: “frog”, “bear”
Output: false




# Solution =============================================
 
# Initialize variables
first_string = "silent"
second_string = "listen"
result = true

# Check if the lengths are the same, if not, they can't be anagrams
if first_string.length != second_string.length
  result = false
else
  # Loop through each character in the first string
  i = 0
  while i < first_string.length
    char = first_string[i]
    found = false

    # Loop through each character in the second string
    j = 0
    while j < second_string.length
      if char == second_string[j]
        # Remove the found character from the second string
        second_string = second_string[0, j] + second_string[j + 1, second_string.length]
        found = true
        break
      end
      j += 1
    end

    # If a character in the first string is not found in the second string, they are not anagrams
    if !found
      result = false
      break
    end

    i += 1
  end
end

# Print the result
puts "Are they anagrams? #{result}"  # Output should be true or false

 
 # Problem -----------------------------------------------------------------
Basic Hash: Complete Data

 Given an array of social media posts and a hash of users, return a list of posts (as an array of hashes) that replaces the submitted_by id number as the person's actual name.

For example, given this array of posts (note that the submitted_by is an id number):

[
{title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
{title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
{title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

And this hash of users (the key is the id number and the value is the user's real name):

users = {403 => "Aunty Em", 231 => "Joelle P.", 989 => "Lyndon Johnson", 111 => "Patti Q."}

Return the array of posts as follows:

[
{title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549},
{title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3},
{title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092},
{title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644}
]




# Solution =============================================

# Initialize variables
posts = [
  {title: 'Me Eating Pizza', submitted_by: 231, likes: 1549},
  {title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3},
  {title: 'best selfie evar!!!', submitted_by: 111, likes: 1092},
  {title: 'Mondays are the worst', submitted_by: 403, likes: 644}
]

users = {403 => "Aunty Em", 231 => "Joelle P.", 989 => "Lyndon Johnson", 111 => "Patti Q."}
updated_posts = []

# Loop through the posts array
i = 0
while i < posts.length
    # Create a new post hash and update the submitted_by field with the name
    post = posts[i]
    user_name = users[post[:submitted_by]]
    
    # Replace the ID with the actual name
    post[:submitted_by] = user_name
    
    # Add the updated post to the updated_posts array
    updated_posts << post
    
    # Move to the next post in the posts array
    i += 1
end

# Print the updated posts
puts "Updated posts are: #{updated_posts}"


 # Problem -----------------------------------------------------------------

 Basic Hash: RNA Transcription

 Given a DNA strand, return its RNA complement (per RNA transcription).

Both DNA and RNA strands are a sequence of nucleotides. Here we're representing the sequences with single-letter characters (e.g. a sample strand may look like: "AGCA".)

Given a string representing a DNA strand, provide its transcribed RNA strand, according to the following pattern:

G becomes C
C becomes G
T becomes A
A becomes U

So based on all this, here's a sample input/output:

Input: 'ACGTGGTCTTAA'
Output: 'UGCACCAGAAUU'


# Solution =============================================

# Initialize variables
dna_strand = 'ACGTGGTCTTAA'
rna_strand = ''
i = 0

# Loop through the DNA strand
while i < dna_strand.length
  nucleotide = dna_strand[i]
  
  # Transcribe the current nucleotide and add it to the RNA strand
  if nucleotide == 'G'
    rna_strand += 'C'
  elsif nucleotide == 'C'
    rna_strand += 'G'
  elsif nucleotide == 'T'
    rna_strand += 'A'
  elsif nucleotide == 'A'
    rna_strand += 'U'
  else
    # Handle invalid input (if any)
    puts "Invalid nucleotide found: #{nucleotide}"
  end
  
  # Move to the next nucleotide in the DNA strand
  i += 1
end

# Print the transcribed RNA strand
puts "Transcribed RNA strand: #{rna_strand}"


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
