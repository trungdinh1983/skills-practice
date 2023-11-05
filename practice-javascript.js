
// # Problem -----------------------------------------------------------------


// # Solution =============================================


// # Problem -----------------------------------------------------------------

From Brute to Linear: Missing Letter

A given string contains all the letters from the alphabet except for one. Return the missing letter.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: “The quick brown box jumps over a lazy dog”
Output: “f”

// # Solution =============================================



// # Problem -----------------------------------------------------------------

From Brute to Linear: Array Duplicate

A given array has one pair of duplicate values. Return the first duplicate value.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [5, 2, 9, 7, 2, 6]
Output: 2


// # Solution =============================================

// Initialize variables
const inputArray = [5, 2, 9, 7, 2, 6];
const seenNumbers = {};
let firstDuplicate = null;

// Loop through the array
let i = 0;

while (i < inputArray.length) {
  // Check if the number is already in the object
  if (seenNumbers[inputArray[i]]) {
    firstDuplicate = inputArray[i];
    break;
  } else {
    // Add the number to the object
    seenNumbers[inputArray[i]] = true;
  }
  
  // Move to the next number in the array
  i++;
}

// Print the first duplicate
if (firstDuplicate !== null) {
  console.log(`First duplicate is: ${firstDuplicate}`); // Output: 2
} else {
  console.log("No duplicates found.");
}


// # Problem -----------------------------------------------------------------

From Brute to Linear: Array Subset

Given two arrays, determine whether one is a subset of the other. It is considered a subset if all the values in one array are contained within the other.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5, 6], [6, 3, 2]
Output: true

Input: [1, 2, 3, 4, 5, 6], [6, 3, 7]
Output: false


// # Solution =============================================

// Initialize variables
const firstArray = [1, 2, 3, 4, 5, 6];
const secondArray = [6, 3, 2];
let result = true;

// Create an object to store the elements of the first array
const hashMap = {};

// Loop through the first array to populate the object
let i = 0;
while (i < firstArray.length) {
  hashMap[firstArray[i]] = true;
  i++;
}

// Loop through the second array to check if each element exists in the object
let j = 0;
while (j < secondArray.length) {
  if (!hashMap[secondArray[j]]) {
    result = false;
    break;
  }
  j++;
}

// Print the result
console.log(`Is the second array a subset of the first? ${result}`);


// # Problem -----------------------------------------------------------------

From Brute to Linear: Array Intersection

Given two arrays, return a new array that contains the intersection of the two arrays. The intersection means the values that are contained in both of the arrays. Do not use the "&", or any built-in intersection methods.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5], [1, 3, 5, 7, 9]
Output: [1, 3, 5]



// # Solution =============================================

// Initialize variables
const firstArray = [1, 2, 3, 4, 5];
const secondArray = [1, 3, 5, 7, 9];
const result = [];

// Create an object to store elements of the first array
const hashMap = {};
let i = 0;
while (i < firstArray.length) {
  hashMap[firstArray[i]] = true;
  i++;
}

// Loop through the second array to find common elements
let j = 0;
while (j < secondArray.length) {
  // Check if the element exists in the object
  if (hashMap[secondArray[j]]) {
    result.push(secondArray[j]); // Add to the result array
  }
  j++;
}

// Print the result
console.log(`Intersection is: ${result}`); // Output should be [1, 3, 5]





// # Problem -----------------------------------------------------------------


//Data Transformation: ETL #3

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



// # Solution =============================================


// Given data
const videos = [
  { title: 'How to Make Wood', author_id: 4, views: 6 },
  { title: 'How to Seem Perfect', author_id: 4, views: 111 },
  { title: 'Review of the New "Unbreakable Mug"', author_id: 2, views: 202 },
  { title: 'Why Pigs Stink', author_id: 1, views: 12 }
];

const authors = [
  { id: 1, first_name: 'Jazz', last_name: 'Callahan' },
  { id: 2, first_name: 'Ichabod', last_name: 'Loadbearer' },
  { id: 3, first_name: 'Saron', last_name: 'Kim' },
  { id: 4, first_name: 'Teena', last_name: 'Burgess' }
];

// Initialize variables
let result = [];

// Loop through the videos array
for (let i = 0; i < videos.length; i++) {
  const video = videos[i];

  // Check if the video has at least 100 views
  if (video.views >= 100) {

    // Find the author associated with the video
    const author = authors.find(author => author.id === video.author_id);

    // Create the author's full name
    const author_name = `${author.first_name} ${author.last_name}`;

    // Create a formatted video object
    const formatted_video = {
      title: video.title,
      views: video.views,
      author_name: author_name
    };

    // Add the formatted video to the result array
    result.push(formatted_video);
  }
}

// Print the result
console.log("Filtered and formatted videos:");
console.log(result);



// # Problem -----------------------------------------------------------------

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


// # Solution =============================================

// Given list of books
const books = [
  { title: "The Lord of the Rings", author: "J. R. R. Tolkien", year: 1954 },
  { title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960 },
  { title: "1984", author: "George Orwell", year: 1949 },
  { title: "Go Set a Watchman", author: "Harper Lee", year: 2015 },
  { title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937 },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925 },
  { title: "The Two Towers", author: "J. R. R. Tolkien", year: 1954 }
];

// Initialize an object to store author-centric data
const authorCentric = {};

// Loop through the list of books
for (let i = 0; i < books.length; i++) {
  const book = books[i];
  const author = book.author;

  // Create a new entry for the author if it doesn't exist
  if (!authorCentric[author]) {
    authorCentric[author] = [];
  }

  // Add book information to the author's entry
  authorCentric[author].push({ title: book.title, year: book.year });
}

// Print the author-centric data (you can use console.log for that)
console.log(authorCentric);



// # Problem -----------------------------------------------------------------

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



// # Solution =============================================

// Given array of posts
const posts = [
  { title: 'Me Eating Pizza', submitted_by: 231, likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: 989, likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: 111, likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: 403, likes: 644 }
];

// Given array of users
const users = [
  { user_id: 403, name: "Aunty Em" },
  { user_id: 231, name: "Joelle P." },
  { user_id: 989, name: "Lyndon Johnson" },
  { user_id: 111, name: "Patti Q." }
];

// Initialize an empty result array
const result = [];

// Loop through posts
for (let i = 0; i < posts.length; i++) {
  const post = posts[i];
  const user_id = post.submitted_by;

  // Find the user with the matching user_id
  for (let j = 0; j < users.length; j++) {
    const user = users[j];
    if (user.user_id === user_id) {
      // Replace the user_id with the user's name
      post.submitted_by = user.name;
      break; // No need to continue searching for this post
    }
  }

  // Add the modified post to the result array
  result.push(post);
}

// Print the result
result.forEach(post => {
  console.log(post);
});



// # Problem -----------------------------------------------------------------

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

// # Solution =============================================

// Initialize variables
const inputHash = {
  1: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2: ["D", "G"],
  3: ["B", "C", "M", "P"],
  4: ["F", "H", "V", "W", "Y"],
  5: ["K"],
  8: ["J", "X"],
  10: ["Q", "Z"]
};

const outputHash = {};

// Loop through the input hash
const keys = Object.keys(inputHash);
for (let i = 0; i < keys.length; i++) {
  const key = keys[i];
  const valueArray = inputHash[key];

  for (let j = 0; j < valueArray.length; j++) {
    // Convert each letter to lowercase and add to output hash
    const letter = valueArray[j].toLowerCase();
    outputHash[letter] = parseInt(key);

    // Move to the next letter in the value array
  }
}

// Print the result
console.log("Transformed hash is:", outputHash);


// # Problem -----------------------------------------------------------------

Data Transformation: Flip Hash

Given a hash, create a new hash that has the keys and values switched.

Input: {"a" => 1, "b" => 2, "c" => 3}
Output: {1 => "a", 2 => "b", 3 => "c"}




// # Solution =============================================

// Initialize variables
const originalHash = { "a": 1, "b": 2, "c": 3 };
const keys = Object.keys(originalHash);
const values = Object.values(originalHash);
let newHash = {};

// Loop through the original hash
for (let i = 0; i < keys.length; i++) {
  // Switch keys and values
  const newKey = values[i];
  const newValue = keys[i];
  
  // Add the switched key-value pair to the new hash
  newHash[newKey] = newValue;
}

// Print the new hash
console.log("The new hash is:", newHash); // Output: { '1': 'a', '2': 'b', '3': 'c' }



// # Problem -----------------------------------------------------------------

Data Transformation: Flatten Hash

Given a hash, return a flat array containing all the hash’s keys and values.

Input: {“a” => 1, “b” => 2, “c” => 3, “d” => 4}
Output: [“a”, 1, “b”, 2, “c”, 3, “d”, 4]


// # Solution =============================================

// Initialize variables
const inputObj = {"a": 1, "b": 2, "c": 3, "d": 4};
let outputArray = [];

// Get keys and values arrays from the object
const keysArray = Object.keys(inputObj);
const valuesArray = Object.values(inputObj);

// Initialize loop variable
let i = 0;

// Loop through the object
while (i < keysArray.length) {
  // Add the key to the output array
  outputArray.push(keysArray[i]);
  
  // Add the value to the output array
  outputArray.push(valuesArray[i]);
  
  // Move to the next key-value pair in the object
  i++;
}

// Print the result
console.log("Flattened array is:", outputArray);


// # Problem -----------------------------------------------------------------


Basic Hash: Anagrams

Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

Do not use any built-in sort methods.

Input: “silent”, “listen”
Output: true

Input: “frog”, “bear”
Output: false

// # Solution =============================================

// Initialize variables
let firstString = "silent";
let secondString = "listen";
let result = true;

// Check if the lengths are the same, if not, they can't be anagrams
if (firstString.length !== secondString.length) {
  result = false;
} else {
  // Loop through each character in the first string
  for (let i = 0; i < firstString.length; i++) {
    let char = firstString[i];
    let found = false;

    // Loop through each character in the second string
    for (let j = 0; j < secondString.length; j++) {
      if (char === secondString[j]) {
        // Remove the found character from the second string
        secondString = secondString.substring(0, j) + secondString.substring(j + 1);
        found = true;
        break;
      }
    }

    // If a character in the first string is not found in the second string, they are not anagrams
    if (!found) {
      result = false;
      break;
    }
  }
}

// Print the result
console.log(`Are they anagrams? ${result}`);  // Output should be true or false


// # Problem -----------------------------------------------------------------

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


// # Solution =============================================



console.log("Updated posts are:", updatedPosts);


 // # Problem -----------------------------------------------------------------

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



// # Solution =============================================

// Initialize variables
const dnaStrand = 'ACGTGGTCTTAA';
let rnaStrand = '';
let i = 0;

// Loop through the DNA strand
while (i < dnaStrand.length) {
  const nucleotide = dnaStrand.charAt(i);

  // Transcribe the current nucleotide and add it to the RNA strand
  if (nucleotide === 'G') {
    rnaStrand += 'C';
  } else if (nucleotide === 'C') {
    rnaStrand += 'G';
  } else if (nucleotide === 'T') {
    rnaStrand += 'A';
  } else if (nucleotide === 'A') {
    rnaStrand += 'U';
  } else {
    // Handle invalid input (if any)
    console.log(`Invalid nucleotide found: ${nucleotide}`);
  }

  // Move to the next nucleotide in the DNA strand
  i++;
}

// Print the transcribed RNA strand
console.log(`Transcribed RNA strand: ${rnaStrand}`);



//  # Problem -----------------------------------------------------------------

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



//# Solution =============================================

const posts = [
  { title: 'Me Eating Pizza', submitted_by: "Joelle P.", likes: 1549 },
  { title: 'i never knew how cool i was until now', submitted_by: "Lyndon Johnson", likes: 3 },
  { title: 'best selfie evar!!!', submitted_by: "Patti Q.", likes: 1092 },
  { title: 'Mondays are the worst', submitted_by: "Aunty Em", likes: 644 }
];

// Initialize an empty array to store popular posts
const popularPosts = [];

// Iterate through each post in the input array
for (const post of posts) {
  // Check if the post has at least 1000 likes
  if (post.likes >= 1000) {
    // If yes, add it to the popularPosts array
    popularPosts.push(post);
  }
}

// Output the filtered array of popular posts
console.log(popularPosts);


//  # Problem -----------------------------------------------------------------

Basic Hash: Menu Pair

 Given a hash, where the keys are strings representing food items, and the values are numbers representing the price of each food, return the amount someone would pay if they'd order one of each food from the entire menu.

 Input: {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
 
 Output: 14
 
 Explanation: If someone would order one of everything on the menu, they'd pay a total of 14 (the sum of all the hash's values).
 
 



// # Solution =============================================

// Initialize variables
const menu = {
  "hot dog": 2,
  "hamburger": 3,
  "steak sandwich": 5,
  "fries": 1,
  "cole slaw": 1,
  "soda": 2
};
let total_price = 0;

// Get the first food item in the menu
let food_item = "";
for (food_item in menu) {
  break; // Exit the loop after getting the first food item
}

// Loop through the menu using a while loop
while (food_item !== undefined) {
  // Add the price of the food item to total_price
  total_price += menu[food_item];
  
  // Get the next food item
  let found = false;
  for (const key in menu) {
    if (found) {
      food_item = key;
      break;
    }
    if (key === food_item) {
      found = true;
    }
  }
}

// Print the total_price
console.log(`Total price of one of everything: ${total_price}`); // Output should be 14




//  # Problem -----------------------------------------------------------------

Basic Hash: Count Words

Given an array of strings, return a hash that provides of a count of how many times each string occurs.

Input: ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"]

Output: {"Dewey" => 6, "Truman" => 5}

Explanation: "Dewey" occurs 6 times in the array, while "Truman" occurs 5 times.



// # Solution =============================================

// Initalize variables
let wordsArray = ["Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"];
let wordCount = {};

// Loop through the Array
for (let i = 0; i < wordsArray.length; i++) {
  let word = wordsArray[i];
  
  // Check if the word is already in the Object
  if (wordCount[word]) {
    wordCount[word] += 1; //Increment the count
  } else {
    wordCount[word] = 1; // Initialize the count]
}
}

// Print the result
console.log("Words counts are:", wordCount); // Words counts are: { Dewey: 6, Truman: 5 }


//  # Problem -----------------------------------------------------------------


Basic Hash: Most Common Letter

Given a string, find the most commonly occurring letter.

Input: “peter piper picked a peck of pickled peppers”
Output: “p”



// # Solution =============================================

// Input String
const inputStr = "peter piper picked a peck of pickled peppers"

// Initialize variables
const charCount = {};
let mostCommonChar = null;
let maxCount = 0;

// Initialize loop counter
let i = 0; // initalize i

// Loop through the characters in the input string using a while loop
while (i < inputStr.length) {
    const char = inputStr[i]; // Get the current character at position i
    if (char === ' ') {
        i++; // Move to the next character
        continue; // skip empty space
    }
    const charLowerCase = char.toLowerCase(); // Convert the character to lowercase
    
    // Assign the current value if it exist if not assign 0
    charCount[charLowerCase] = charCount[charLowerCase] || 0;
    charCount[charLowerCase]++;
    
    // Check if this character has the highest count currently
    if (charCount[charLowerCase] > maxCount) { maxCount = charCount[charLowerCase];
        mostCommonChar = charLowerCase;
}
i++; // move to the next character
}
// Print the most common letter
console.log(`Most common character is: '${mostCommonChar}'`);


//  # Problem -----------------------------------------------------------------

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

// # Solution =============================================

function longestCommonPrefix(strings) {
  // If there's nothing in the array, just return an empty string
  if (strings.length === 0) return "";


  // Start with the first string in the array as a reference
  let refString = strings[0];

  // An array to hold the prefix
  let newPrefix = new Array(refString.length)
  let newPrefixLength = refString.length;

  for ( let i = 1; i < strings.length; i++) {
    let j = 0;
    let tempLength = 0;

 

    // Loop through and compare each char
    while (j < newPrefixLength && j < refString.length && j < strings[i].length) {
      // If the letters don't match, time to break
      if (refString[j] !== strings[i][j]) break;
newPrefix[tempLength] = refString[j];
      // Move on to the next letter
      j++;
      tempLength++;
    }

    // Uodate the prefix with only the matching part
    newPrefixLength = tempLength;

    // If prefix is empty, no common prefix
    if (newPrefixLength === 0) return "";
  }

  //Convert the array to a string manually
  let prefixStr = "";
  for (let i = 0; i < newPrefixLength; i++) {
    prefixStr += newPrefix[i];
  }

  return prefixStr;
}

// Test the code
console.log(longestCommonPrefix(["flower", "flow", "flight"])); //should be fl
console.log(longestCommonPrefix(["dog", "racecar", "car"])); // Should be ""

 //# Problem -----------------------------------------------------------------

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




// Solution =============================================

//Initialize variables
let numArray = [1, 2, 3, 97, 98, 98];
let isCoolioi = true; // We'lll assume it's a Coolio array until proven otherwise

//Initialize loop variables
i = 0; // Start at beginning (0)
j = numArray.length - 1 //Start at the last element(99)

//Loop through the array
while (i < j) {
    //Check if the sum of the i and j element is 100
    if (numArray[i] + numArray[j] != 100 ) {
        isCoolio = false; // Not = 100 so Coolio false
        break; //No need to check further
    }
    
    //Move to the next pair of elements
    i++; // i = i + 1
    j--; // j = j - 1
}

//Print the result
if (isCoolio) {
    console.log("Yep, it's a 100 Coolio Array!");
} else {
    console.log("Nah, It's not a 100 Coolio Array!");
}


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
