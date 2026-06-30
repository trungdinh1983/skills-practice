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
# 125. Find Floor and Ceil of a number in a sorted array
# Solution ============================================

def find_floor_and_ceil(arr, target):
    # arr is the sorted list of numbers we are searching through
    # target is the number we want to find the floor and ceil for
    # Example: arr = [1, 2, 4, 6, 10, 12, 14] and target = 7

    # floor_value starts at -1 meaning we have not found a floor yet
    # It will be updated when we find a number less than or equal to target
    floor_value = -1

    # ceil_value starts at -1 meaning we have not found a ceil yet
    # It will be updated when we find a number greater than or equal to target
    ceil_value = -1

    # low is the starting index of the search area
    # Index 0 means we start at the first element of the array
    # Example: arr[0] is 1 in our array
    low = 0

    # high is the ending index of the search area
    # len(arr) gives the total count of elements in the array
    # We subtract 1 because index starts at 0, not 1
    # Example: len([1, 2, 4, 6, 10, 12, 14]) is 7, so high is 6
    # arr[6] is 14, which is the last element
    high = len(arr) - 1

    # Binary search loop
    while low <= high:
        mid = (low + high) // 2  # Find the middle index

        if arr[mid] == target:
            # Exact match means floor and ceil are the same
            return arr[mid], arr[mid]
        elif arr[mid] < target:
            floor_value = arr[mid]  # arr[mid] is a candidate for floor
            low = mid + 1           # Search the right half
        else:
            ceil_value = arr[mid]   # arr[mid] is a candidate for ceil
            high = mid - 1          # Search the left half

    return floor_value, ceil_value

arr = [1, 2, 4, 6, 10, 12, 14]
target = 7
floor_value, ceil_value = find_floor_and_ceil(arr, target)
print("Floor:", floor_value)
print("Ceil:", ceil_value)

# Comment =============================================
# Floor means the largest number in the array that is less than or equal to the target.
# Ceil means the smallest number in the array that is greater than or equal to the target.
# We use binary search because the array is already sorted.
# Binary search cuts the search area in half each time, which is much faster than checking every element.
# We track floor and ceil as candidates and update them as we search.
# If the middle value is less than the target, it could be the floor, so we save it and move right.
# If the middle value is greater than the target, it could be the ceil, so we save it and move left.
# If the middle value equals the target, both floor and ceil are the same number.

# Math/Calculations ===================================
# Array is [1, 2, 4, 6, 10, 12, 14], target is 7.
# Step 1: low is 0, high is 6, mid is 3. arr[3] is 6. 6 is less than 7, so floor is 6. Move low to 4.
# Step 2: low is 4, high is 6, mid is 5. arr[5] is 12. 12 is greater than 7, so ceil is 12. Move high to 4.
# Step 3: low is 4, high is 4, mid is 4. arr[4] is 10. 10 is greater than 7, so ceil is 10. Move high to 3.
# Step 4: low is 4, high is 3. Loop ends because low is greater than high.
# Final floor is 6 and final ceil is 10.

# Output ==============================================
# Floor: 6
# Ceil: 10
# Problem =============================================
# 124. Find smallest missing element from a sorted array
# Solution ============================================

def find_smallest_missing(arr):
    # Start by assuming the missing number is 0
    missing = 0

    # Go through each number in the array
    for num in arr:
        # If the current number matches what we expect, move expected up by one
        if num == missing:
            missing = missing + 1

    # Return the first number that was never found
    return missing

arr = [0, 1, 2, 3, 5, 6]
result = find_smallest_missing(arr)
print(result)

# Comment =============================================
# We use a variable called missing to track the next expected number.
# We start at 0 because the smallest possible missing number is 0.
# We loop through the sorted array one number at a time.
# If the current number matches our expected number, we increase expected by one.
# If the current number does not match, we stop increasing and return missing.
# The loop ends when we find a gap or finish checking all numbers.
# This works because the array is sorted so gaps appear in order.

# Math/Calculations ===================================
# Array: [0, 1, 2, 3, 5, 6]
# Step 1: missing = 0, num = 0, 0 == 0 so missing becomes 1
# Step 2: missing = 1, num = 1, 1 == 1 so missing becomes 2
# Step 3: missing = 2, num = 2, 2 == 2 so missing becomes 3
# Step 4: missing = 3, num = 3, 3 == 3 so missing becomes 4
# Step 5: missing = 4, num = 5, 5 != 4 so missing stays 4
# Step 6: missing = 4, num = 6, 6 != 4 so missing stays 4
# Loop ends, return 4

# Output ==============================================
# 4
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