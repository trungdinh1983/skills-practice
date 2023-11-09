
// # Problem -----------------------------------------------------------------


// # Solution =============================================


// # Problem -----------------------------------------------------------------

From Brute to Linear: Missing Letter

A given string contains all the letters from the alphabet except for one. Return the missing letter.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: “The quick brown box jumps over a lazy dog”
Output: “f”

// # Solution =============================================

public class MissingLetterFinder {
  public static void main(String[] args) {
      // Initialize variables
      String inputString = "The quick brown box jumps over a lazy dog";
      char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
      Character result = null;

      // Convert input string to lowercase and split into an array of characters
      char[] inputArray = inputString.toLowerCase().toCharArray();

      // Sort the array to ensure the order (not necessary if input is already sorted)
      java.util.Arrays.sort(inputArray);

      // Loop through the alphabet
      int i = 0;
      int j = 0;

      while (i < alphabet.length) {
          // Check if the current letter in the alphabet is in the input array
          if (j < inputArray.length && alphabet[i] == inputArray[j]) {
              // If it is, move to the next letter in the input array
              j++;
          } else {
              // If it isn't, we've found our missing letter
              result = alphabet[i];
              break; // Exit the loop since we found the missing letter
          }

          // Move to the next letter in the alphabet
          i++;
      }

      // Print the result
      if (result != null) {
          System.out.println("The missing letter is: " + result);
      } else {
          System.out.println("No missing letters found.");
      }
  }
}


// # Problem -----------------------------------------------------------------

From Brute to Linear: Array Duplicate

A given array has one pair of duplicate values. Return the first duplicate value.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [5, 2, 9, 7, 2, 6]
Output: 2




// # Solution =============================================

import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        // Initialize variables
        int[] inputArray = {5, 2, 9, 7, 2, 6};
        Set<Integer> seenNumbers = new HashSet<>();
        Integer firstDuplicate = null;

        // Loop through the array
        int i = 0;

        while (i < inputArray.length) {
            // Check if the number is already in the set
            if (seenNumbers.contains(inputArray[i])) {
                firstDuplicate = inputArray[i];
                break;
            } else {
                // Add the number to the set
                seenNumbers.add(inputArray[i]);
            }

            // Move to the next number in the array
            i++;
        }

        // Print the first duplicate
        if (firstDuplicate != null) {
            System.out.println("First duplicate is: " + firstDuplicate); // Output: 2
        } else {
            System.out.println("No duplicates found.");
        }
    }
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

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        // Initialize variables
        int[] firstArray = {1, 2, 3, 4, 5, 6};
        int[] secondArray = {6, 3, 2};
        boolean result = true;

        // Create a HashMap to store the elements of the first array
        HashMap<Integer, Boolean> hashMap = new HashMap<>();

        // Loop through the first array to populate the HashMap
        int i = 0;
        while (i < firstArray.length) {
            hashMap.put(firstArray[i], true);
            i++;
        }

        // Loop through the second array to check if each element exists in the HashMap
        int j = 0;
        while (j < secondArray.length) {
            if (!hashMap.containsKey(secondArray[j])) {
                result = false;
                break;
            }
            j++;
        }

        // Print the result
        System.out.println("Is the second array a subset of the first? " + result);
    }
}



// # Problem -----------------------------------------------------------------

From Brute to Linear: Array Intersection

Given two arrays, return a new array that contains the intersection of the two arrays. The intersection means the values that are contained in both of the arrays. Do not use the "&", or any built-in intersection methods.

NOTE: You must accomplish this in O(n) time. This is also known as linear time.

Input: [1, 2, 3, 4, 5], [1, 3, 5, 7, 9]
Output: [1, 3, 5]



// #Solution =============================================

import java.util.HashSet;

public class Main {
    public static void main(String[] args) {
        // Initialize variables
        int[] firstArray = {1, 2, 3, 4, 5};
        int[] secondArray = {1, 3, 5, 7, 9};
        HashSet<Integer> resultSet = new HashSet<>();

        // Create a HashSet to store elements of the first array
        HashSet<Integer> hashMap = new HashSet<>();
        int i = 0;
        while (i < firstArray.length) {
            hashMap.add(firstArray[i]);
            i++;
        }

        // Loop through the second array to find common elements
        int j = 0;
        while (j < secondArray.length) {
            // Check if the element exists in the HashSet
            if (hashMap.contains(secondArray[j])) {
                resultSet.add(secondArray[j]); // Add to the result set
            }
            j++;
        }

        // Print the result
        System.out.println("Intersection is: " + resultSet); // Output should be [1, 3, 5]
    }
}




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

import java.util.ArrayList;
import java.util.List;

// Define a class to represent video data
class Video {
    String title;
    int author_id;
    int views;

    Video(String title, int author_id, int views) {
        this.title = title;
        this.author_id = author_id;
        this.views = views;
    }
}

// Define a class to represent author data
class Author {
    int id;
    String first_name;
    String last_name;

    Author(int id, String first_name, String last_name) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
    }
}

public class VideoFilter {
    public static void main(String[] args) {
        // Given data
        List<Video> videos = new ArrayList<>();
        videos.add(new Video("How to Make Wood", 4, 6));
        videos.add(new Video("How to Seem Perfect", 4, 111));
        videos.add(new Video("Review of the New \"Unbreakable Mug\"", 2, 202));
        videos.add(new Video("Why Pigs Stink", 1, 12));

        List<Author> authors = new ArrayList<>();
        authors.add(new Author(1, "Jazz", "Callahan"));
        authors.add(new Author(2, "Ichabod", "Loadbearer"));
        authors.add(new Author(3, "Saron", "Kim"));
        authors.add(new Author(4, "Teena", "Burgess"));

        // Initialize a list to store the filtered and formatted videos
        List<Video> result = new ArrayList<>();

        // Loop through the videos list
        for (Video video : videos) {
            // Check if the video has at least 100 views
            if (video.views >= 100) {
                // Find the author associated with the video
                Author author = null;
                for (Author a : authors) {
                    if (a.id == video.author_id) {
                        author = a;
                        break;
                    }
                }

                // Create the author's full name
                String authorName = author.first_name + " " + author.last_name;

                // Create a formatted video object
                Video formattedVideo = new Video(video.title, 0, video.views); // Omit author_id

                // Set the author_name attribute
                formattedVideo.author_id = authorName;

                // Add the formatted video to the result list
                result.add(formattedVideo);
            }
        }

        // Print the filtered and formatted videos
        System.out.println("Filtered and formatted videos:");
        for (Video video : result) {
            System.out.println("Title: " + video.title);
            System.out.println("Views: " + video.views);
            System.out.println("Author Name: " + video.author_id);
        }
    }
}




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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookConversion {
    public static void main(String[] args) {
        // Given list of books
        List<Map<String, Object>> books = new ArrayList<>();
        books.add(Map.of("title", "The Lord of the Rings", "author", "J. R. R. Tolkien", "year", 1954));
        books.add(Map.of("title", "To Kill a Mockingbird", "author", "Harper Lee", "year", 1960));
        books.add(Map.of("title", "1984", "author", "George Orwell", "year", 1949));
        books.add(Map.of("title", "Go Set a Watchman", "author", "Harper Lee", "year", 2015));
        books.add(Map.of("title", "The Hobbit", "author", "J. R. R. Tolkien", "year", 1937));
        books.add(Map.of("title", "The Great Gatsby", "author", "F. Scott Fitzgerald", "year", 1925));
        books.add(Map.of("title", "The Two Towers", "author", "J. R. R. Tolkien", "year", 1954));

        // Initialize a map to store author-centric data
        Map<String, List<Map<String, Object>>> authorCentric = new HashMap<>();

        // Loop through the list of books
        for (Map<String, Object> book : books) {
            String author = (String) book.get("author");

            // Create a new entry for the author if it doesn't exist
            authorCentric.putIfAbsent(author, new ArrayList<>());

            // Add book information to the author's entry
            authorCentric.get(author).add(
                Map.of("title", book.get("title"), "year", book.get("year"))
            );
        }

        // Print the author-centric data
        System.out.println(authorCentric);
    }
}




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

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Given array of posts
        List<Post> posts = new ArrayList<>();
        posts.add(new Post("Me Eating Pizza", 231, 1549));
        posts.add(new Post("i never knew how cool i was until now", 989, 3));
        posts.add(new Post("best selfie evar!!!", 111, 1092));
        posts.add(new Post("Mondays are the worst", 403, 644));

        // Given array of users
        List<User> users = new ArrayList<>();
        users.add(new User(403, "Aunty Em"));
        users.add(new User(231, "Joelle P."));
        users.add(new User(989, "Lyndon Johnson"));
        users.add(new User(111, "Patti Q."));

        // Initialize an empty result array
        List<Post> result = new ArrayList<>();

        // Loop through posts
        for (Post post : posts) {
            int userId = post.getSubmittedBy();

            // Find the user with the matching user_id
            for (User user : users) {
                if (user.getUserId() == userId) {
                    // Replace the user_id with the user's name
                    post.setSubmittedBy(user.getName());
                    break; // No need to continue searching for this post
                }
            }

            // Add the modified post to the result array
            result.add(post);
        }

        // Print the result
        for (Post post : result) {
            System.out.println(post);
        }
    }
}

class Post {
    private String title;
    private int submittedBy;
    private int likes;

    public Post(String title, int submittedBy, int likes) {
        this.title = title;
        this.submittedBy = submittedBy;
        this.likes = likes;
    }

    public String getTitle() {
        return title;
    }

    public int getSubmittedBy() {
        return submittedBy;
    }

    public void setSubmittedBy(String name) {
        this.submittedBy = name;
    }

    @Override
    public String toString() {
        return "Post{" +
                "title='" + title + '\'' +
                ", submittedBy='" + submittedBy + '\'' +
                ", likes=" + likes +
                '}';
    }
}

class User {
    private int userId;
    private String name;

    public User(int userId, String name) {
        this.userId = userId;
        this.name = name;
    }

    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }
}


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


import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        // Initialize variables
        Map<Integer, List<String>> inputHash = new HashMap<>();
        inputHash.put(1, Arrays.asList("A", "E", "I", "O", "U", "L", "N", "R", "S", "T"));
        inputHash.put(2, Arrays.asList("D", "G"));
        inputHash.put(3, Arrays.asList("B", "C", "M", "P"));
        inputHash.put(4, Arrays.asList("F", "H", "V", "W", "Y"));
        inputHash.put(5, Arrays.asList("K"));
        inputHash.put(8, Arrays.asList("J", "X"));
        inputHash.put(10, Arrays.asList("Q", "Z"));

        Map<String, Integer> outputHash = new HashMap<>();

        // Loop through the input hash
        for (Map.Entry<Integer, List<String>> entry : inputHash.entrySet()) {
            Integer key = entry.getKey();
            List<String> valueList = entry.getValue();

            for (String letter : valueList) {
                // Convert each letter to lowercase and add to output hash
                String lowercaseLetter = letter.toLowerCase();
                outputHash.put(lowercaseLetter, key);
            }
        }

        // Print the result
        System.out.println("Transformed hash is: " + outputHash);
    }
}


// # Problem -----------------------------------------------------------------

Data Transformation: Flip Hash

Given a hash, create a new hash that has the keys and values switched.

Input: {"a" => 1, "b" => 2, "c" => 3}
Output: {1 => "a", 2 => "b", 3 => "c"}




// # Solution =============================================

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        // Initialize variables
        HashMap<String, Integer> originalHash = new HashMap<>();
        originalHash.put("a", 1);
        originalHash.put("b", 2);
        originalHash.put("c", 3);

        HashMap<Integer, String> newHash = new HashMap<>();

        // Loop through the original hash
        for (var entry : originalHash.entrySet()) {
            // Switch keys and values
            Integer newKey = entry.getValue();
            String newValue = entry.getKey();

            // Add the switched key-value pair to the new hash
            newHash.put(newKey, newValue);
        }

        // Print the new hash
        System.out.println("The new hash is: " + newHash);  // Output: {1=a, 2=b, 3=c}
    }
}


// # Problem -----------------------------------------------------------------

Data Transformation: Flatten Hash

Given a hash, return a flat array containing all the hash’s keys and values.

Input: {“a” => 1, “b” => 2, “c” => 3, “d” => 4}
Output: [“a”, 1, “b”, 2, “c”, 3, “d”, 4]


// # Solution =============================================

import java.util.ArrayList;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        // Initialize HashMap
        HashMap<String, Integer> inputMap = new HashMap<>();
        inputMap.put("a", 1);
        inputMap.put("b", 2);
        inputMap.put("c", 3);
        inputMap.put("d", 4);

        // Initialize ArrayList for the output
        ArrayList<Object> outputList = new ArrayList<>();

        // Loop through the HashMap
        for (String key : inputMap.keySet()) {
            // Add the key to the output ArrayList
            outputList.add(key);

            // Add the value to the output ArrayList
            outputList.add(inputMap.get(key));
        }

        // Print the result
        System.out.println("Flattened ArrayList is: " + outputList);
    }
}


// # Problem -----------------------------------------------------------------


Basic Hash: Anagrams

Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

Do not use any built-in sort methods.

Input: “silent”, “listen”
Output: true

Input: “frog”, “bear”
Output: false


// # Solution =============================================

public class Main {
  public static void main(String[] args) {
    // Initialize variables
    String firstString = "silent";
    String secondString = "listen";
    boolean result = true;

    // Check if the lengths are the same, if not, they can't be anagrams
    if (firstString.length() != secondString.length()) {
      result = false;
    } else {
      // Loop through each character in the first string
      for (int i = 0; i < firstString.length(); i++) {
        char charAtI = firstString.charAt(i);
        boolean found = false;

        // Loop through each character in the second string
        for (int j = 0; j < secondString.length(); j++) {
          if (charAtI == secondString.charAt(j)) {
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
    System.out.println("Are they anagrams? " + result);  // Output should be true or false
  }
}


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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Create the list of posts
        List<HashMap<String, Object>> posts = new ArrayList<>();
        
        HashMap<String, Object> post1 = new HashMap<>();
        post1.put("title", "Me Eating Pizza");
        post1.put("submitted_by", 231);
        post1.put("likes", 1549);
        posts.add(post1);

        HashMap<String, Object> post2 = new HashMap<>();
        post2.put("title", "i never knew how cool i was until now");
        post2.put("submitted_by", 989);
        post2.put("likes", 3);
        posts.add(post2);

        HashMap<String, Object> post3 = new HashMap<>();
        post3.put("title", "best selfie evar!!!");
        post3.put("submitted_by", 111);
        post3.put("likes", 1092);
        posts.add(post3);

        HashMap<String, Object> post4 = new HashMap<>();
        post4.put("title", "Mondays are the worst");
        post4.put("submitted_by", 403);
        post4.put("likes", 644);
        posts.add(post4);

        // Create the hash of users
        HashMap<Integer, String> users = new HashMap<>();
        users.put(403, "Aunty Em");
        users.put(231, "Joelle P.");
        users.put(989, "Lyndon Johnson");
        users.put(111, "Patti Q.");

        // Replace submitted_by id with actual name using while loop
        int i = 0;
        while (i < posts.size()) {
            HashMap<String, Object> post = posts.get(i);
            int id = (int) post.get("submitted_by");
            if (users.containsKey(id)) {
                post.put("submitted_by", users.get(id));
            }
            i++;
        }

        // Print the updated posts
        System.out.println(posts);
    }
}


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

public class DNAToRNA {
  public static void main(String[] args) {
      // Initialize variables
      String dnaStrand = "ACGTGGTCTTAA";
      StringBuilder rnaStrand = new StringBuilder();
      int i = 0;

      // Loop through the DNA strand
      while (i < dnaStrand.length()) {
          char nucleotide = dnaStrand.charAt(i);

          // Transcribe the current nucleotide and add it to the RNA strand
          if (nucleotide == 'G') {
              rnaStrand.append('C');
          } else if (nucleotide == 'C') {
              rnaStrand.append('G');
          } else if (nucleotide == 'T') {
              rnaStrand.append('A');
          } else if (nucleotide == 'A') {
              rnaStrand.append('U');
          } else {
              // Handle invalid input (if any)
              System.out.println("Invalid nucleotide found: " + nucleotide);
          }

          // Move to the next nucleotide in the DNA strand
          i++;
      }

      // Print the transcribed RNA strand
      System.out.println("Transcribed RNA strand: " + rnaStrand.toString());
  }
}



//# Problem -----------------------------------------------------------------

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



// # Solution =============================================

public class Post {
  String title;
  String submittedBy;
  int likes;

  public Post(String title, String submittedBy, int likes) {
      this.title = title;
      this.submittedBy = submittedBy;
      this.likes = likes;
  }

  public static void main(String[] args) {
      Post[] posts = new Post[4];
      posts[0] = new Post("Me Eating Pizza", "Joelle P.", 1549);
      posts[1] = new Post("i never knew how cool i was until now", "Lyndon Johnson", 3);
      posts[2] = new Post("best selfie evar!!!", "Patti Q.", 1092);
      posts[3] = new Post("Mondays are the worst", "Aunty Em", 644);

      // Initialize variables to count popular posts and store them
      int popularCount = 0;
      Post[] popularPosts = new Post[posts.length];

      // Iterate through each post in the input array
      for (Post post : posts) {
          // Check if the post has at least 1000 likes
          if (post.likes >= 1000) {
              // If yes, add it to the popularPosts array
              popularPosts[popularCount] = post;
              popularCount++;
          }
      }

      // Output the filtered list of popular posts
      for (int i = 0; i < popularCount; i++) {
          System.out.println("Title: " + popularPosts[i].title);
          System.out.println("Submitted by: " + popularPosts[i].submittedBy);
          System.out.println("Likes: " + popularPosts[i].likes);
          System.out.println(); // Add a newline for separation
      }
  }
}


//# Problem -----------------------------------------------------------------


Basic Hash: Menu Pair

 Given a hash, where the keys are strings representing food items, and the values are numbers representing the price of each food, return the amount someone would pay if they'd order one of each food from the entire menu.

 Input: {"hot dog" => 2, "hamburger" => 3, "steak sandwich" => 5, "fries" => 1, "cole slaw" => 1, "soda" => 2}
 
 Output: 14
 
 Explanation: If someone would order one of everything on the menu, they'd pay a total of 14 (the sum of all the hash's values).
 
 

// # Solution =============================================

# Initialize variables
menu = {
    "hot dog": 2,
    "hamburger": 3,
    "steak sandwich": 5,
    "fries": 1,
    "cole slaw": 1,
    "soda": 2
}
total_price = 0

# We need keys from the dictionary to loop through it
for food_item in menu.keys():
    # Add its price to total_price
    total_price += menu[food_item]  # total_price = total_price + menu[food_item]

# Print the total_price
print(f"Total price of one of everything: {total_price}")  # Output should be 14



// # Problem -----------------------------------------------------------------

Basic Hash:Count Words

Given an array of strings,return a hash that provides of a count of how many times each string occurs.

Input:["Dewey","Truman","Dewey","Dewey","Truman","Truman","Dewey","Truman","Truman","Dewey","Dewey"]

Output:{"Dewey"=>6,"Truman"=>5}

Explanation:"Dewey"occurs 6 times in the array,while"Truman"occurs 5 times.

// # Solution =============================================

import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        String[] wordsArray = {"Dewey", "Truman", "Dewey", "Dewey", "Truman", "Truman", "Dewey", "Truman", "Truman", "Dewey", "Dewey"};
        HashMap<String, Integer> wordCount = new HashMap<>();
        
        // Loop through the Array
        for (String word : wordsArray) {
            int count = 0;
            // Check if the word is already in the HashMap
          if (wordCount.containsKey(word)) {
                count = wordCount.remove(word);
            }
                wordCount.put(word, count + 1); // Initialize the count
     
        }
        
        // Print the result
        System.out.println("Words counts are: " + wordCount);
    }
}


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
