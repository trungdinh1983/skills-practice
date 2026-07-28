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
# 129.Maximum Sum Subarray using Divide & Conquer ; Given an integer array, find the maximum sum among all subarrays possible.
#
# The problem differs from the problem of finding the maximum subsequence sum. Unlike subsequences, subarrays are required to occupy consecutive positions within the original array.
#
#  For example,
#
# Input:  nums[] = [2, -4, 1, 9, -6, 7, -3] Output: The maximum sum of the subarray is 11 (Marked in Green)


# Solution============================================

def maximum_crossing_sum(numbers, left_index, middle_index, right_index):
    # This function finds the best sum of a piece that must touch the middle.
    # First we walk from the middle toward the left and keep the best total.
    best_left_total = numbers[middle_index]
    running_total = 0
    for position in range(middle_index, left_index - 1, -1):
        running_total = running_total + numbers[position]
        if running_total > best_left_total:
            best_left_total = running_total

    # Now we walk from just right of the middle toward the right and keep the best total.
    best_right_total = numbers[middle_index + 1]
    running_total = 0
    for position in range(middle_index + 1, right_index + 1):
        running_total = running_total + numbers[position]
        if running_total > best_right_total:
            best_right_total = running_total

    # The crossing piece is the best left part joined with the best right part.
    return best_left_total + best_right_total


def maximum_subarray_sum(numbers, left_index, right_index):
    # When only one number is left, that number is the answer for this small part.
    if left_index == right_index:
        return numbers[left_index]

    # Cut the current part into two halves.
    middle_index = (left_index + right_index) // 2

    # Best sum that stays inside the left half.
    left_answer = maximum_subarray_sum(numbers, left_index, middle_index)
    # Best sum that stays inside the right half.
    right_answer = maximum_subarray_sum(numbers, middle_index + 1, right_index)
    # Best sum that crosses over the middle line.
    crossing_answer = maximum_crossing_sum(numbers, left_index, middle_index, right_index)

    # The true answer is the largest of these three choices.
    return max(left_answer, right_answer, crossing_answer)


numbers = [2, -4, 1, 9, -6, 7, -3]
answer = maximum_subarray_sum(numbers, 0, len(numbers) - 1)
print("The maximum sum of the subarray is", answer)


# Comment =============================================
# A subarray is a group of numbers that sit next to each other in the list.
# We are allowed to pick any starting spot and any ending spot, but we cannot skip numbers in between.
#
# Divide and conquer means we solve a big problem by cutting it into smaller problems.
# We cut the list in half at the middle. The best subarray must be in one of three places.
# One, it sits completely inside the left half.
# Two, it sits completely inside the right half.
# Three, it starts in the left half and ends in the right half, so it crosses the middle.
#
# The first two cases are solved by calling the same function again on a smaller part.
# The third case cannot be solved by cutting again, so we solve it with two simple loops.
# We start at the middle and add numbers one at a time going left, and we remember the best total we ever saw.
# We do the same thing going right. Adding the two best totals gives the best crossing subarray.
#
# We start the best totals with a real number from the list instead of zero.
# This matters when every number is negative, because zero would be a wrong answer.
#
# The list is cut in half about log base two of n times, and each level does about n additions.
# So the total work is n times log n, which is faster than checking every possible subarray.


# Math/Calculations ===================================
# Input list: [2, -4, 1, 9, -6, 7, -3]
# Index positions: 0 1 2 3 4 5 6
#
# Step one, cut the whole list at middle index 3.
#
# Left half is indexes 0 to 3, which is [2, -4, 1, 9]
#   Cut at middle index 1.
#   Indexes 0 to 1 is [2, -4]
#     Left is 2. Right is -4. Crossing is 2 plus -4 which is -2. Best is 2.
#   Indexes 2 to 3 is [1, 9]
#     Left is 1. Right is 9. Crossing is 1 plus 9 which is 10. Best is 10.
#   Crossing for indexes 0 to 3, middle at index 1.
#     Going left from index 1: -4, then -4 plus 2 is -2. Best left total is -2.
#     Going right from index 2: 1, then 1 plus 9 is 10. Best right total is 10.
#     Crossing total is -2 plus 10 which is 8.
#   Best of 2, 10, and 8 is 10.
#
# Right half is indexes 4 to 6, which is [-6, 7, -3]
#   Cut at middle index 5.
#   Indexes 4 to 5 is [-6, 7]
#     Left is -6. Right is 7. Crossing is -6 plus 7 which is 1. Best is 7.
#   Index 6 alone is -3.
#   Crossing for indexes 4 to 6, middle at index 5.
#     Going left from index 5: 7, then 7 plus -6 is 1. Best left total is 7.
#     Going right from index 6: -3. Best right total is -3.
#     Crossing total is 7 plus -3 which is 4.
#   Best of 7, -3, and 4 is 7.
#
# Crossing for the whole list, middle at index 3.
#   Going left from index 3: 9, then 9 plus 1 is 10, then 10 plus -4 is 6, then 6 plus 2 is 8.
#   Best left total is 10, which covers indexes 2 to 3.
#   Going right from index 4: -6, then -6 plus 7 is 1, then 1 plus -3 is -2.
#   Best right total is 1, which covers indexes 4 to 5.
#   Crossing total is 10 plus 1 which is 11.
#
# Final answer is the best of 10, 7, and 11, which is 11.
# That sum comes from the subarray [1, 9, -6, 7] at indexes 2 to 5.


# Output ==============================================
# The maximum sum of the subarray is 11
# Problem =============================================
# 128. Find the peak element in an array
# Given an integer array, find the peak element in it. A peak element is an element that is greater than its neighbors. There might be multiple peak elements in an array, and the solution should report any peak element.
#
# An element A[i] of an array A is a peak element if it's not smaller than its neighbor(s).
#
# A[i-1] <= A[i] >= A[i+1] for 0 < i < n-1
# A[i-1] <= A[i] if i = n - 1
# A[i] >= A[i+1] if i = 0
#
# For example,
# Input : [8, 9, 10, 2, 5, 6]
# Output: The peak element is 10 (or 6)
# Input : [8, 9, 10, 12, 15]
# Output: The peak element is 15
# Input : [10, 8, 6, 5, 3, 2]
# Output: The peak element is 10

# Solution ============================================
def find_peak_element(numbers):
    # Set the search range from the first position to the last position
    low_position = 0
    high_position = len(numbers) - 1
    # Keep searching while the range has more than one element
    while low_position < high_position:
        # Find the middle position of the current range
        middle_position = (low_position + high_position) // 2
        # If the middle element is smaller than the next element, a peak is on the right side
        if numbers[middle_position] < numbers[middle_position + 1]:
            low_position = middle_position + 1
        # Otherwise a peak is at the middle or on the left side
        else:
            high_position = middle_position
    # When the range narrows to one element, that element is a peak
    return numbers[low_position]

# Test the function with three example arrays
print("The peak element is", find_peak_element([8, 9, 10, 2, 5, 6]))
print("The peak element is", find_peak_element([8, 9, 10, 12, 15]))
print("The peak element is", find_peak_element([10, 8, 6, 5, 3, 2]))

# Comment =============================================
# This solution uses binary search to find a peak quickly.
# The idea is simple. Look at the middle element and its right neighbor.
# If the middle element is smaller than its right neighbor, the numbers are going up.
# Going up means a peak must exist somewhere on the right side.
# If the middle element is not smaller, the numbers are going down or flat.
# Going down means the middle element itself could be a peak, or a peak is on the left side.
# Each step cuts the search range in half, so the search is very fast.
# The loop stops when only one element remains, and that element is a peak.

# Math/Calculations ===================================
# Example with the array [8, 9, 10, 2, 5, 6]:
# Step 1: low_position = 0, high_position = 5, middle_position = (0 + 5) // 2 = 2
#         numbers[2] = 10 and numbers[3] = 2, since 10 is not smaller than 2, high_position = 2
# Step 2: low_position = 0, high_position = 2, middle_position = (0 + 2) // 2 = 1
#         numbers[1] = 9 and numbers[2] = 10, since 9 is smaller than 10, low_position = 2
# Step 3: low_position = 2 and high_position = 2, the loop stops
# The answer is numbers[2] which is 10
# Time cost: the range is cut in half each step, so the time is logarithm of n
# Space cost: only a few variables are used, so the space is constant

# Output ==============================================
# The peak element is 10
# The peak element is 15
# The peak element is 10

# Problem =============================================
# Find the number of 1's in a sorted binary array
# 127. Given a sorted binary array, efficiently count the total number of 1's in it.
#
# For example,
#
# Input:  nums[] = [0, 0, 0, 0, 1, 1, 1] Output: The total number of 1's present is 3
# Input:  nums[] = [0, 0, 1, 1, 1, 1, 1] Output: The total number of 1's present is 5

# Solution============================================
def count_ones(nums):
    low = 0
    high = len(nums) - 1
    first_one_index = len(nums)

    while low <= high:
        middle = (low + high) // 2
        if nums[middle] == 1:
            first_one_index = middle
            high = middle - 1
        else:
            low = middle + 1

    return len(nums) - first_one_index


numbers_list = [0, 0, 0, 0, 1, 1, 1]
total_ones = count_ones(numbers_list)
print("The total number of 1's present is", total_ones)

# Comment =============================================
# The array is sorted, so all the zero values come first and all the one
# values come after them. This means we do not need to check every single
# number one by one. Instead we can use a method called binary search to
# find the first place where the number one appears. Binary search works
# by checking the middle number of the list and deciding if we should
# search the left half or the right half next. We keep cutting the search
# area in half until we find the first one value. Once we know where the
# first one is located, we can find the total count of ones by subtracting
# that position from the total length of the list. This is much faster
# than checking every number one at a time.

# Math/Calculations ===================================
# The list has seven numbers in total, at positions zero through six.
# The values are zero, zero, zero, zero, one, one, one.
# The first one value appears at position four.
# The total length of the list is seven.
# To find the total number of ones we subtract the position of the first
# one from the total length of the list.
# Seven minus four equals three.
# So the total number of ones present is three.

# Output ==============================================
# The total number of 1's present is 3

# 126.Search in a nearly sorted array in O(logn) time
# We are given a sorted array, but each element could be swapped
# with its next or previous neighbor. We need to search for a target
# value in this array and return its index. The search must run in
# order log n time, which means we need to use a binary search idea
# instead of checking every single number one by one.

# Solution============================================
def search_nearly_sorted(numbers, target):
    # This variable marks the start of the search area
    low = 0
    # This variable marks the end of the search area
    high = len(numbers) - 1

    # We keep searching while the start is not past the end
    while low <= high:
        # Find the middle position of the current search area
        middle = (low + high) // 2

        # Check the middle number first
        if numbers[middle] == target:
            return middle
        # Check the number right before the middle position
        if middle - 1 >= low and numbers[middle - 1] == target:
            return middle - 1
        # Check the number right after the middle position
        if middle + 1 <= high and numbers[middle + 1] == target:
            return middle + 1

        # If the middle number is smaller than the target,
        # the target must be in the right side, so we move low forward
        if numbers[middle] < target:
            low = middle + 2
        # Otherwise the target must be in the left side,
        # so we move high backward
        else:
            high = middle - 2

    # If we finish the loop and never found the target, return negative one
    return -1


# Comment =============================================
# The main idea is that even though numbers can be swapped with a
# neighbor, the array is still close to sorted. So we still use the
# binary search idea of cutting the search area in half each time.
# The only difference from normal binary search is that at each middle
# position, we also check one step to the left and one step to the
# right, because the target might have been swapped into one of those
# spots.

# Math/Calculations ===================================
# Normal binary search cuts the array in half every time, giving a
# time cost of order log base two of n.
# In this problem, at each step we still cut the search area roughly
# in half, since we move low or high by two positions instead of one.
# Checking the middle, left neighbor, and right neighbor only adds a
# constant number of extra steps each time, which does not change the
# overall speed.
# So the total time cost is still order log base two of n.

# Output ==============================================
# Example: numbers = [10, 5, 20, 15, 30], target = 5
# Middle position starts at index 2, value 20, not a match
# Check left neighbor at index 1, value 5, this is a match
# Result: index 1

# Example: numbers = [2, 1, 4, 3, 6, 5, 8, 7], target = 8
# Program will return index 6
print(search_nearly_sorted([10, 5, 20, 15, 30], 5))
print(search_nearly_sorted([2, 1, 4, 3, 6, 5, 8, 7], 8))
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