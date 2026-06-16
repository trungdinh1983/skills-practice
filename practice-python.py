#Write the answer in a format I copy to Python file, putting all non‑code inside comments under five headings—Problem, Solution, Comment, Math/Calculations, and Output—in that exact order. Explain everything in full words (no abbreviations) so a beginner can follow, this include codes. MAke sure code is beginner-friendly, no advanced Python features, and no abbreviations in comments. Use simple words and short sentences. Do not use any special characters like emojis or markdown formatting. Keep solution as condense as possible with shortest amount of line possible
# Problem =============================================
#Keep exact problem text and do not change wording: 
#
# Solution============================================

# Problem =============================================
#Keep exact problem text, if not in problem form, please generate simplify coding  problem and do not change wording: 

# Solution============================================
#provide simplified and easily understand code solution for the problem above. Keep code as short as possible. Write code in long form so it is easy to understand from perspective beginner coder to understand with short comments explaining each step. Avoid advanced Ruby features and keep code beginner-friendly.
# Comment =============================================


# Math/Calculations ===================================

# Output ==============================================
# Problem =============================================
# 123. Count occurrences of a number in a sorted array with duplicates
# Solution ============================================

def find_first(array, target):
    left = 0
    right = len(array) - 1
    result = -1
    while left <= right:
        mid = (left + right) // 2        # find the middle index
        if array[mid] == target:
            result = mid                  # save this position
            right = mid - 1              # keep searching left
        elif array[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return result

def find_last(array, target):
    left = 0
    right = len(array) - 1
    result = -1
    while left <= right:
        mid = (left + right) // 2        # find the middle index
        if array[mid] == target:
            result = mid                  # save this position
            left = mid + 1               # keep searching right
        elif array[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return result

def count_occurrences(array, target):
    first = find_first(array, target)    # find where target starts
    if first == -1:
        return 0                         # target not found at all
    last = find_last(array, target)      # find where target ends
    return last - first + 1             # count = last position minus first position plus one

array = [1, 2, 2, 2, 3, 4, 5]
target = 2
count = count_occurrences(array, target)
print(count)

# Comment =============================================
# We use binary search two times on a sorted array.
# The first search finds the leftmost position of the target.
# The second search finds the rightmost position of the target.
# Binary search cuts the search area in half each step.
# This is faster than checking every element one by one.

# Math/Calculations ===================================
# Array is [1, 2, 2, 2, 3, 4, 5] and target is 2.
# find_first returns index 1 because that is the first 2.
# find_last returns index 3 because that is the last 2.
# Count equals last minus first plus one.
# Count equals 3 minus 1 plus 1 which equals 3.
# Time complexity is O(log n) because we use binary search.
# Space complexity is O(1) because we use no extra storage.

# Output ==============================================
# 3
# Problem =============================================
# 122. Find first or last occurrence of a given number in a sorted array

# Solution ============================================

def find_occurrence(array, target, find_first):
    result = -1
    low = 0
    high = len(array) - 1

    while low <= high:
        mid = (low + high) // 2      # find the middle index

        if array[mid] == target:
            result = mid             # save this position as a valid answer
            if find_first:
                high = mid - 1       # keep searching left for first occurrence
            else:
                low = mid + 1        # keep searching right for last occurrence
        elif array[mid] < target:
            low = mid + 1            # target is in the right half
        else:
            high = mid - 1           # target is in the left half

    return result

numbers = [1, 3, 5, 5, 5, 7, 9]
target = 5

first = find_occurrence(numbers, target, find_first=True)
last  = find_occurrence(numbers, target, find_first=False)

print("First occurrence of", target, "is at index:", first)
print("Last occurrence of",  target, "is at index:", last)

# Comment =============================================
# We use binary search to find the target number.
# Binary search works only on sorted arrays.
# We cut the search range in half each loop.
# When we find the target, we do not stop right away.
# We save the index and keep searching in one direction.
# If find_first is True, we search the left side.
# If find_first is False, we search the right side.
# This lets us find both the first and last position.
# We run the function two times, once for each position.
# The variable result holds the last valid index we found.

# Math/Calculations ===================================
# Array: [1, 3, 5, 5, 5, 7, 9]
# Indices: 0  1  2  3  4  5  6
# Target: 5
#
# Finding first occurrence:
# Step 1: low = 0, high = 6, mid = 3, array[3] = 5, match, result = 3, search left, high = 2
# Step 2: low = 0, high = 2, mid = 1, array[1] = 3, too small, low = 2
# Step 3: low = 2, high = 2, mid = 2, array[2] = 5, match, result = 2, search left, high = 1
# Step 4: low = 2, high = 1, loop ends
# First occurrence index = 2
#
# Finding last occurrence:
# Step 1: low = 0, high = 6, mid = 3, array[3] = 5, match, result = 3, search right, low = 4
# Step 2: low = 4, high = 6, mid = 5, array[5] = 7, too big, high = 4
# Step 3: low = 4, high = 4, mid = 4, array[4] = 5, match, result = 4, search right, low = 5
# Step 4: low = 5, high = 4, loop ends
# Last occurrence index = 4

# Output ==============================================
# First occurrence of 5 is at index: 2
# Last occurrence of 5 is at index: 4