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
# 139.Coin Change Problem (Total number of ways to get the denomination of coins) Given an unlimited supply of coins of given denominations, find the total number of distinct ways to get the desired change.
#
# For example,
#
# Input: S = { 1, 3, 5, 7 }, target = 8 The total number of ways is 6 { 1, 7 }{ 3, 5 }{ 1, 1, 3, 3 }{ 1, 1, 1, 5 }{ 1, 1, 1, 1, 1, 3 }{ 1, 1, 1, 1, 1, 1, 1, 1 }  Input: S = { 1, 2, 3 }, target = 4 The total number of ways is 4 { 1, 3 }{ 2, 2 }{ 1, 1, 2 }{ 1, 1, 1, 1 }

# Solution ============================================

def count_ways(coins, target):
    # Make a list where position number holds the number of ways to make that amount
    ways = [0] * (target + 1)
    # There is exactly one way to make the amount zero, which is to use no coins
    ways[0] = 1
    # Look at one coin at a time so the same group of coins is never counted twice
    for coin in coins:
        # Update every amount that this coin can help build
        for amount in range(coin, target + 1):
            # Add the ways to make the amount that is left after using this coin
            ways[amount] = ways[amount] + ways[amount - coin]
    # The last position holds the answer for the target amount
    return ways[target]

print("The total number of ways is", count_ways([1, 3, 5, 7], 8))
print("The total number of ways is", count_ways([1, 2, 3], 4))

# Comment =============================================
# This solution uses a method called dynamic programming.
# Dynamic programming means we solve small problems first.
# Then we use those small answers to build bigger answers.
# The list named ways stores the answer for every amount from zero up to the target.
# We loop over the coins on the outside and over the amounts on the inside.
# This order is important.
# It makes sure the order of coins does not matter.
# So one plus three and three plus one are counted as the same single way.
# If we swapped the two loops, we would count different orders as different ways, which is wrong here.
# Each coin can be used again and again, because the supply is unlimited.
# That is why the inner loop goes upward from the coin value to the target.
# The running time grows with the number of coins multiplied by the target amount.
# The memory used grows with the target amount, because we keep one list of that size.

# Math/Calculations ===================================
# Example with coins 1, 2, 3 and target 4.
# Start: ways for amounts 0, 1, 2, 3, 4 is 1, 0, 0, 0, 0
#
# Use coin 1:
# amount 1 gets 0 plus ways of 0 which is 1, so it becomes 1
# amount 2 gets 0 plus ways of 1 which is 1, so it becomes 1
# amount 3 gets 0 plus ways of 2 which is 1, so it becomes 1
# amount 4 gets 0 plus ways of 3 which is 1, so it becomes 1
# Now the list is 1, 1, 1, 1, 1
#
# Use coin 2:
# amount 2 gets 1 plus ways of 0 which is 1, so it becomes 2
# amount 3 gets 1 plus ways of 1 which is 1, so it becomes 2
# amount 4 gets 1 plus ways of 2 which is 2, so it becomes 3
# Now the list is 1, 1, 2, 2, 3
#
# Use coin 3:
# amount 3 gets 2 plus ways of 0 which is 1, so it becomes 3
# amount 4 gets 3 plus ways of 1 which is 1, so it becomes 4
# Now the list is 1, 1, 2, 3, 4
#
# The answer for target 4 is the last number, which is 4.
# The same steps with coins 1, 3, 5, 7 and target 8 give the answer 6.

# Output ==============================================
# The total number of ways is 6
# The total number of ways is 4

# Problem =============================================
# 138.Coin change-making problem (unlimited supply of coins) : Given an unlimited supply of coins of given denominations, find the minimum number of coins required to get the desired change.
#
# For example, consider S = { 1, 3, 5, 7 }.
#
# If the desired change is 15, the minimum number of coins required is 3 (7 + 7 + 1) or (5 + 5 + 5) or (3 + 5 + 7)  If the desired change is 18, the minimum number of coins required is 4 (7 + 7 + 3 + 1) or (5 + 5 + 5 + 3) or (7 + 5 + 5 + 1)

# Solution ============================================

def find_minimum_coins(coins, desired_change):
    # Make a list with one spot for every amount from 0 up to the desired change.
    # Each spot will hold the fewest coins needed for that amount.
    # We start every spot with a number that is too big, meaning "not possible yet".
    minimum_coins = [desired_change + 1] * (desired_change + 1)

    # Zero change needs zero coins.
    minimum_coins[0] = 0

    # Go through every amount, from 1 up to the desired change.
    for amount in range(1, desired_change + 1):
        # Try every coin for this amount.
        for coin in coins:
            # The coin can only be used if it is not bigger than the amount.
            # If using it gives fewer coins than we have now, save the new smaller count.
            if coin <= amount and minimum_coins[amount - coin] + 1 < minimum_coins[amount]:
                minimum_coins[amount] = minimum_coins[amount - coin] + 1

    # If the count is still too big, the change cannot be made with these coins.
    if minimum_coins[desired_change] > desired_change:
        return -1

    # Return the fewest coins for the desired change.
    return minimum_coins[desired_change]


coins = [1, 3, 5, 7]
print("Desired change 15, minimum coins:", find_minimum_coins(coins, 15))
print("Desired change 18, minimum coins:", find_minimum_coins(coins, 18))

# Comment =============================================
# This solution uses a method called dynamic programming.
# The idea is simple. We solve small amounts first.
# Then we use those answers to solve bigger amounts.
# For any amount, we try each coin as the last coin.
# If the last coin is 7, we still need the amount minus 7.
# We already know the best answer for that smaller amount.
# So the answer is that smaller answer plus 1 coin.
# We pick the coin that gives the smallest total.
# Coins can be used again and again, because every amount
# looks back at the full list of coins each time.
# If an amount cannot be made at all, the function returns -1.
# The running time grows with the desired change multiplied
# by the number of coin types. The extra memory grows with
# the desired change, because of the list.

# Math/Calculations ===================================
# Coins are 1, 3, 5, and 7.
# The rule for each amount is:
#   fewest coins for amount = smallest of (fewest coins for amount minus coin) plus 1
#
# Amount 0  -> 0 coins
# Amount 1  -> 1 coin   (1)
# Amount 2  -> 2 coins  (1 + 1)
# Amount 3  -> 1 coin   (3)
# Amount 4  -> 2 coins  (3 + 1)
# Amount 5  -> 1 coin   (5)
# Amount 6  -> 2 coins  (5 + 1)
# Amount 7  -> 1 coin   (7)
# Amount 8  -> 2 coins  (7 + 1)
# Amount 9  -> 3 coins  (7 + 1 + 1)
# Amount 10 -> 2 coins  (7 + 3)
# Amount 11 -> 3 coins  (7 + 3 + 1)
# Amount 12 -> 2 coins  (7 + 5)
# Amount 13 -> 3 coins  (7 + 5 + 1)
# Amount 14 -> 2 coins  (7 + 7)
# Amount 15 -> 3 coins  (7 + 7 + 1)
# Amount 16 -> 4 coins  (7 + 7 + 1 + 1)
# Amount 17 -> 3 coins  (7 + 7 + 3)
# Amount 18 -> 4 coins  (7 + 7 + 3 + 1)
#
# Check for 15: amount 15 minus coin 7 is 8. Amount 8 needs 2 coins. So 2 + 1 = 3 coins.
# Check for 18: amount 18 minus coin 7 is 11. Amount 11 needs 3 coins. So 3 + 1 = 4 coins.
# Why 18 cannot use 3 coins: every coin is an odd number.
# Three odd numbers always add up to an odd number, and 18 is even.
# So 18 needs an even number of coins. Two coins reach at most 14. So 4 is the smallest.

# Output ==============================================
# Desired change 15, minimum coins: 3
# Desired change 18, minimum coins: 4
# Problem =============================================
# 137. Rod Cutting : Given a rod of length n and a list of rod prices of length i,
# where 1 <= i <= n, find the optimal way to cut the rod into smaller rods to
# maximize profit.
#
# For example, consider the following rod lengths and values:
#
# Input: length[] = [1, 2, 3, 4, 5, 6, 7, 8]
#        price[]  = [1, 5, 8, 9, 10, 17, 17, 20]
# Rod length: 4
# Best: Cut the rod into two pieces of length 2 each to gain revenue of 5 + 5 = 10
#
# Cut           Profit
# 4             9
# 1, 3          (1 + 8) = 9
# 2, 2          (5 + 5) = 10
# 3, 1          (8 + 1) = 9
# 1, 1, 2       (1 + 1 + 5) = 7
# 1, 2, 1       (1 + 5 + 1) = 7
# 2, 1, 1       (5 + 1 + 1) = 7
# 1, 1, 1, 1    (1 + 1 + 1 + 1) = 4

# Solution ============================================
def cut_rod(prices, rod_length):
    # best_profit at position k holds the most money we can make from a rod of length k
    best_profit = [0] * (rod_length + 1)
    # first_cut at position k holds the length of the first piece in the best plan
    first_cut = [0] * (rod_length + 1)
    # Solve every shorter length first, from 1 up to the full rod length
    for current_length in range(1, rod_length + 1):
        # Try every possible size for the first piece
        for piece_length in range(1, current_length + 1):
            # Money from this piece plus the best money from the rest of the rod
            profit = prices[piece_length - 1] + best_profit[current_length - piece_length]
            # Keep this choice if it beats the best one found so far
            if profit > best_profit[current_length]:
                best_profit[current_length] = profit
                first_cut[current_length] = piece_length
    # Walk back through the saved first cuts to list every piece
    pieces = []
    remaining = rod_length
    while remaining > 0:
        pieces.append(first_cut[remaining])
        remaining = remaining - first_cut[remaining]
    return best_profit[rod_length], pieces

# The price at position 0 is for a piece of length 1, position 1 is for length 2, and so on
prices = [1, 5, 8, 9, 10, 17, 17, 20]
maximum_profit, pieces = cut_rod(prices, 4)
print("Maximum profit:", maximum_profit)
print("Pieces:", pieces)

# Comment =============================================
# This solution uses a method called dynamic programming.
# The idea is simple. The best answer for a long rod is built from
# the best answers for shorter rods.
# For each rod length, we try every size for the first piece.
# The rest of the rod already has its best answer saved, so we just look it up.
# This avoids checking every possible cut combination again and again.
# The first_cut list remembers which first piece gave the best answer.
# At the end, we follow those saved first pieces to list all the cuts.
# The time needed grows with the rod length times the rod length.
# The extra memory needed grows with the rod length.

# Math/Calculations ===================================
# best profit for length 0 = 0
#
# Length 1:
#   first piece 1: 1 + best profit of 0 (0) = 1
#   best = 1, first piece = 1
#
# Length 2:
#   first piece 1: 1 + best profit of 1 (1) = 2
#   first piece 2: 5 + best profit of 0 (0) = 5
#   best = 5, first piece = 2
#
# Length 3:
#   first piece 1: 1 + best profit of 2 (5) = 6
#   first piece 2: 5 + best profit of 1 (1) = 6
#   first piece 3: 8 + best profit of 0 (0) = 8
#   best = 8, first piece = 3
#
# Length 4:
#   first piece 1: 1 + best profit of 3 (8) = 9
#   first piece 2: 5 + best profit of 2 (5) = 10
#   first piece 3: 8 + best profit of 1 (1) = 9
#   first piece 4: 9 + best profit of 0 (0) = 9
#   best = 10, first piece = 2
#
# Listing the pieces:
#   remaining 4, first piece is 2, remaining becomes 2
#   remaining 2, first piece is 2, remaining becomes 0
#   pieces = 2 and 2

# Output ==============================================
# Maximum profit: 10
# Pieces: [2, 2]
# Problem =============================================
# 136.Minimum Sum Partition problem. 
# Given a set of positive integers S, partition set S into two subsets, S1 and S2, such that the difference between the sum of elements in S1 and S2 is minimized. The solution should return the minimum absolute difference between the sum of elements of two partitions.
#
# For example, consider S = {10, 20, 15, 5, 25}.
#
#  We can partition S into two partitions where the minimum absolute difference between the sum of elements is 5.
#
# S1 = {10, 20, 5}S2 = {15, 25}
#
# Note that this solution is not unique. The following is another solution:
#
# S1 = {10, 25}S2 = {20, 15, 5}

# Solution ============================================

def minimum_difference(numbers):
    # Add up every number in the list.
    total = sum(numbers)
    # Half of the total, rounded down. One group should get as close to this as possible.
    half = total // 2
    # possible[amount] is True when some numbers can add up to exactly that amount.
    # At the start, only the amount 0 is possible, because we can pick no numbers.
    possible = [True] + [False] * half
    # Look at each number one at a time.
    for number in numbers:
        # Go from half down to number, one step at a time, so each number is used only once.
        for amount in range(half, number - 1, -1):
            # If we could already make (amount minus number), adding this number makes amount.
            if possible[amount - number]:
                possible[amount] = True
    # Find the largest possible amount that is not more than half.
    best = 0
    for amount in range(half + 1):
        if possible[amount]:
            best = amount
    # One group has best. The other group has total minus best. Return the gap between them.
    return total - 2 * best

print(minimum_difference([10, 20, 15, 5, 25]))

# Comment =============================================
# The idea: if one group has a sum called best, the other group has total minus best.
# The difference is (total minus best) minus best, which is total minus 2 times best.
# To make the difference small, best should be as close to half of the total as possible.
# So the question becomes: what is the largest sum, not more than half, that we can build?
# We use a list of True and False values to remember which sums we can build.
# This method is called dynamic programming. It means we save small answers and reuse them.
# The inner loop goes backward, from big amounts to small amounts.
# Going backward stops us from using the same number twice in one step.
# If we went forward, a number like 5 could be added again and again, which is wrong.
# The line range(half, number - 1, -1) means: start at half, stop just before number minus 1, move down by 1.
# The line [True] + [False] * half makes a list with one True followed by half copies of False.
# Time needed: about (how many numbers) times (half of the total) steps.
# Memory needed: a list with about half of the total plus one spots.

# Math/Calculations ===================================
# Numbers: 10, 20, 15, 5, 25
# Total = 10 + 20 + 15 + 5 + 25 = 75
# Half = 75 divided by 2, rounded down = 37
#
# Sums we can build, updated after each number (only sums up to 37 are kept):
# Start:           0
# After adding 10: 0, 10
# After adding 20: 0, 10, 20, 30
# After adding 15: 0, 10, 15, 20, 25, 30, 35   (45 is more than 37, so it is skipped)
# After adding 5:  0, 5, 10, 15, 20, 25, 30, 35
# After adding 25: 0, 5, 10, 15, 20, 25, 30, 35   (nothing new up to 37)
#
# Largest sum not more than 37 is 35.
# One group sums to 35, for example 10 + 25.
# Other group sums to 75 minus 35 = 40, for example 20 + 15 + 5.
# Difference = 75 minus 2 times 35 = 75 minus 70 = 5

# Output ==============================================
# 5

# Problem =============================================
# Keep exact problem text and do not change wording:
#
# 135.Subset sum problem : Dynamic Programming Solution
# Given a set of positive integers and an integer k, check if there is any non-empty subset that sums to k.
#
# For example,
#
# Input: A = { 7, 3, 2, 5, 8 }k = 14 Output: Subset with the given sum exists Subset { 7, 2, 5 } sums to 14

# Solution============================================

def subset_sum_exists(numbers, target):
    # This list remembers which totals we can already build.
    # Position zero means a total of zero, which we can always build by picking nothing.
    possible = [False] * (target + 1)
    possible[0] = True

    # Look at one number at a time.
    for number in numbers:
        # Make a fresh copy so each number is used at most one time.
        new_possible = list(possible)
        # Try adding the current number to every total we could already build.
        for total in range(0, target + 1):
            if possible[total] and total + number <= target:
                new_possible[total + number] = True
        possible = new_possible

    # The target must be one or more, because the subset must not be empty.
    return target > 0 and possible[target]


numbers = [7, 3, 2, 5, 8]
target = 14

if subset_sum_exists(numbers, target):
    print("Subset with the given sum exists")
else:
    print("Subset with the given sum does not exist")

# Comment =============================================
# The plain idea is to ask a smaller question many times instead of testing every
# possible subset one by one.
#
# We build a list called possible. Every position in that list stands for one total,
# from zero up to the target. If the value stored at a position is True, it means we
# have found some group of numbers that adds up to that total.
#
# At the start only the total zero is marked True, because picking no numbers gives
# a sum of zero.
#
# Then we walk through the numbers one at a time. For each number we ask this simple
# question about every total we already know how to make: if I add this number to that
# total, do I land on a new total that is still not larger than the target? If yes, we
# mark that new total as True.
#
# We copy the list into new_possible before we start marking. Without the copy, a total
# we just marked could be used again in the same round, which would let us take the same
# number two or more times. The problem allows each number only one time.
#
# After all numbers are seen, we look at the position for the target. If it is True,
# some group of the given numbers adds up to the target.
#
# The check that the target is greater than zero is there because the problem asks for a
# non-empty subset. Position zero is always True, but it stands for choosing nothing.
#
# The amount of work is the count of numbers multiplied by the target value. For five
# numbers and a target of fourteen that is a very small amount of work compared with
# testing all thirty-two possible subsets.

# Math/Calculations ===================================
# Numbers are 7, 3, 2, 5, 8 and the target is 14.
# Below is the set of totals marked True after each number is used.
#
# Start:            0
# After using 7:    0, 7
# After using 3:    0, 3, 7, 10
# After using 2:    0, 2, 3, 5, 7, 9, 10, 12
# After using 5:    0, 2, 3, 5, 7, 8, 9, 10, 12, 14
# After using 8:    0, 2, 3, 5, 7, 8, 9, 10, 12, 14
#
# The total 14 first appears while using the number 5, because 9 was already reachable
# and 9 plus 5 is 14. The total 9 came from 7 plus 2. So the group is 7, 2 and 5, and
# 7 plus 2 plus 5 equals 14.
#
# Totals larger than 14 are never stored, because the list stops at the target.

# Output ==============================================
# Subset with the given sum exists
# Problem =============================================
# 134.Partition problem:
# Given a list of positive whole numbers, decide if the list can be split
# into two groups so that the sum of the first group is equal to the sum
# of the second group.

# Solution============================================

def can_partition(numbers):
    # Add every number in the list together.
    total = sum(numbers)
    # If the total is an odd number, two equal halves are impossible.
    if total % 2 != 0:
        return False
    # Each group must add up to exactly one half of the total.
    half = total // 2
    # Make a list of true and false answers for every sum from zero to half.
    # The position in the list is the sum we are asking about.
    reachable = [False] * (half + 1)
    # A sum of zero is always possible, because we can pick nothing.
    reachable[0] = True
    # Look at one number at a time.
    for number in numbers:
        # Walk backward so each number is used only one time.
        for amount in range(half, number - 1, -1):
            # If the smaller sum was possible, then this bigger sum is possible.
            if reachable[amount - number]:
                reachable[amount] = True
    # The answer is whether we can reach exactly one half of the total.
    return reachable[half]


print(can_partition([1, 5, 11, 5]))
print(can_partition([1, 2, 3, 5]))

# Comment =============================================
# The main idea is that we only need to build one group.
# If one group adds up to one half of the total, then the numbers left over
# must add up to the other half by themselves.
# So the question becomes simpler: can we pick some numbers that add up to half?
#
# The list named reachable remembers which sums we can already build.
# At the start only the sum zero is possible.
# Each time we look at a new number, we ask which new sums it creates.
# If the sum five was already possible and the new number is six,
# then the sum eleven is now possible too.
#
# We count backward in the inner loop for one important reason.
# Counting forward would let the same number be added again and again
# in the same pass, as if we owned many copies of it.
# Counting backward reads only the older answers, so each number is used once.
#
# The odd total check at the top is a fast exit.
# An odd number cannot be cut into two equal whole number halves.

# Math/Calculations ===================================
# First example: the list is 1, 5, 11, 5.
# Total is 1 plus 5 plus 11 plus 5, which is 22.
# 22 divided by 2 leaves no remainder, so half is 11.
# Sums we can build as we add each number:
#   start          possible sums are 0
#   after 1        possible sums are 0 and 1
#   after 5        possible sums are 0, 1, 5, 6
#   after 11       possible sums are 0, 1, 5, 6, 11, 12, 16, 17
#   after 5        the sum 11 is still possible
# The sum 11 is reachable, so the answer is true.
# One valid split is the group 11 and the group 1, 5, 5.
#
# Second example: the list is 1, 2, 3, 5.
# Total is 1 plus 2 plus 3 plus 5, which is 11.
# 11 divided by 2 leaves a remainder of 1, so the total is odd.
# We stop right away and the answer is false.
#
# Speed: the outer loop runs one time for each number in the list,
# and the inner loop runs about half the total times.
# So the work is the count of numbers multiplied by half of the total.

# Output ==============================================
# True
# False

# Problem =============================================
# Keep exact problem text and do not change wording:
# 133.Maximize value of the expression : Given an array A, maximize value of expression (A[s] - A[r] + A[q] - A[p]), where p, q, r, and s are indices of the array and s > r > q > p.
#
# For example,
#
# Input:  A[] = [3, 9, 10, 1, 30, 40] Output: 46 Explanation: The expression (40 - 1 + 10 - 3) will result in the maximum value


# Solution============================================

def maximize_expression(numbers):
    # Start every best value at negative infinity, which means "nothing found yet".
    value_after_one = float("-inf")    # best value of (minus A[p])
    value_after_two = float("-inf")    # best value of (A[q] minus A[p])
    value_after_three = float("-inf")  # best value of (minus A[r] plus A[q] minus A[p])
    value_after_four = float("-inf")   # best value of the complete expression

    for current_number in numbers:
        # Update from the last part to the first part.
        # This order makes sure every index used is smaller than the current index.
        value_after_four = max(value_after_four, value_after_three + current_number)
        value_after_three = max(value_after_three, value_after_two - current_number)
        value_after_two = max(value_after_two, value_after_one + current_number)
        value_after_one = max(value_after_one, -current_number)

    return value_after_four


array_of_numbers = [3, 9, 10, 1, 30, 40]
print(maximize_expression(array_of_numbers))


# Comment =============================================
# The simple idea would be to try every choice of the four indices.
# That would need four loops inside each other and would be very slow.
#
# A faster idea is to build the expression one piece at a time.
# The expression is (A[s] minus A[r] plus A[q] minus A[p]).
# Read it from right to left, so the pieces are added in this order:
#   piece one   is (minus A[p])
#   piece two   is (minus A[p] plus A[q])
#   piece three is (minus A[p] plus A[q] minus A[r])
#   piece four  is (minus A[p] plus A[q] minus A[r] plus A[s])
#
# We walk through the array one time and keep the best value for each piece.
# When we look at a number, we ask four questions:
#   Can this number be the final number A[s] added to the best piece three?
#   Can this number be A[r] subtracted from the best piece two?
#   Can this number be A[q] added to the best piece one?
#   Can this number be A[p] and start a new piece one?
#
# We must update piece four first, then piece three, then piece two, then piece one.
# The reason is that each line then uses a best value that was built only from
# numbers that came before the current number. That keeps the rule s > r > q > p true.
#
# The loop runs one time over the array, so the work grows in a straight line
# with the size of the array. The extra memory used is only four variables.
# The array must have at least four numbers for a real answer to exist.


# Math/Calculations ===================================
# The array is [3, 9, 10, 1, 30, 40].
# The word "none" below means negative infinity, so no valid piece was found yet.
#
# current number 3:
#   piece four  stays none
#   piece three stays none
#   piece two   stays none
#   piece one   becomes minus 3
#
# current number 9:
#   piece four  stays none
#   piece three stays none
#   piece two   becomes minus 3 plus 9 which is 6
#   piece one   stays minus 3, because minus 9 is smaller
#
# current number 10:
#   piece four  stays none
#   piece three becomes 6 minus 10 which is minus 4
#   piece two   becomes minus 3 plus 10 which is 7
#   piece one   stays minus 3
#
# current number 1:
#   piece four  becomes minus 4 plus 1 which is minus 3
#   piece three becomes 7 minus 1 which is 6
#   piece two   stays 7
#   piece one   becomes minus 1
#
# current number 30:
#   piece four  becomes 6 plus 30 which is 36
#   piece three stays 6
#   piece two   becomes minus 1 plus 30 which is 29
#   piece one   stays minus 1
#
# current number 40:
#   piece four  becomes 6 plus 40 which is 46
#
# The final answer is 46.
# This matches the expression 40 minus 1 plus 10 minus 3, which equals 46.
# Here A[p] is 3, A[q] is 10, A[r] is 1, and A[s] is 40.


# Output ==============================================
# 46

# Problem =============================================
# Keep exact problem text and do not change wording:
# 132.0–1 Knapsack problem : In the 0–1 Knapsack problem, we are given a set of items,
# each with a weight and a value, and we need to determine the number of each item to
# include in a collection so that the total weight is less than or equal to a given
# limit and the total value is as large as possible.
#
# Please note that the items are indivisible; we can either take an item or not
# (0-1 property). For example,
#
# Input: value = [ 20, 5, 10, 40, 15, 25 ] weight = [ 1, 2, 3, 8, 7, 4 ] int W = 10
# Output: Knapsack value is 60 value = 20 + 40 = 60 weight = 1 + 8 = 9 < W


# Solution============================================

def find_best_knapsack_value(value_list, weight_list, weight_limit):
    # Count how many items we have in total.
    number_of_items = len(value_list)

    # Build a table of zeros. One row for each item count, one column for each weight.
    table = [[0] * (weight_limit + 1) for row_number in range(number_of_items + 1)]

    # Look at one item at a time. Row one means the first item is now available.
    for item_number in range(1, number_of_items + 1):

        # Look at every possible amount of space in the bag, from zero to the limit.
        for space_left in range(weight_limit + 1):

            # First choice: skip this item. The best value stays the same as the row above.
            best_value = table[item_number - 1][space_left]

            # Second choice: take this item, but only if it fits in the space we have.
            if weight_list[item_number - 1] <= space_left:
                space_after_taking = space_left - weight_list[item_number - 1]
                value_when_taking = value_list[item_number - 1] + table[item_number - 1][space_after_taking]

                # Keep the larger of the two choices.
                if value_when_taking > best_value:
                    best_value = value_when_taking

            # Store the winner for this item and this amount of space.
            table[item_number][space_left] = best_value

    # The bottom right corner holds the answer for all items and the full weight limit.
    return table[number_of_items][weight_limit]


# Run the example from the problem.
value_list = [20, 5, 10, 40, 15, 25]
weight_list = [1, 2, 3, 8, 7, 4]
weight_limit = 10

answer = find_best_knapsack_value(value_list, weight_list, weight_limit)
print("Knapsack value is", answer)


# Comment =============================================
# Each item has two states only. We either leave it out or we put it in the bag.
# We cannot cut an item in half. That is what the zero one part of the name means.
#
# Trying every possible group of items is very slow, because six items already give
# sixty four groups, and twenty items give more than one million groups.
#
# So we build a table instead. The value in the table at row item number and column
# space left answers this small question: if I am only allowed to use the first few
# items, and my bag can hold only that much weight, what is the best total value?
#
# We fill the table from the top left to the bottom right. Every answer we need for a
# new box was already worked out and saved in the row above it. So each box costs us
# only one comparison, and we never repeat the same work twice.
#
# Row zero stays all zeros because with no items available the best value is zero.
# Column zero stays all zeros because with no space in the bag we cannot take anything.
#
# The two choices in the loop are the whole idea:
#   Skip the item. Copy the value straight down from the row above.
#   Take the item. Add its value, then look up the best value for the leftover space
#   using only the earlier items. We look at the row above so the same item is never
#   used twice.
# We keep whichever choice gives the larger number.


# Math/Calculations ===================================
# The items are, written as weight and value pairs:
#   Item one:   weight 1, value 20
#   Item two:   weight 2, value 5
#   Item three: weight 3, value 10
#   Item four:  weight 8, value 40
#   Item five:  weight 7, value 15
#   Item six:   weight 4, value 25
# The weight limit is 10.
#
# One winning group is item one and item four:
#   Total weight is 1 plus 8, which is 9. That is less than 10, so it fits.
#   Total value is 20 plus 40, which is 60.
#
# Another winning group is item one, item two, item three, and item six:
#   Total weight is 1 plus 2 plus 3 plus 4, which is exactly 10. That fits.
#   Total value is 20 plus 5 plus 10 plus 25, which is also 60.
#
# So sixty is the largest total value, and two different groups reach it.
#
# Size of the work:
#   The table has number of items plus one rows, which is 7 rows here.
#   The table has weight limit plus one columns, which is 11 columns here.
#   That is 77 boxes, and each box takes one addition and one comparison.
#   In general the running time is number of items multiplied by weight limit.


# Output ==============================================
# Knapsack value is 60

# Problem =============================================
# 131. Matrix Chain Multiplication: Determine the optimal
# parenthesization of a product of n matrices.
#
# Matrix chain multiplication (or Matrix Chain Ordering Problem, MCOP) is an optimization problem
# that to find the most efficient way to multiply a given sequence of matrices. The problem is not
# actually to perform the multiplications but merely to decide the sequence of the matrix
# multiplications involved.
#
# The matrix multiplication is associative as no matter how the product is parenthesized, the result
# obtained will remain the same. For example, for four matrices A, B, C, and D, we would have:
#
# ((AB)C)D = ((A(BC))D) = (AB)(CD) = A((BC)D) = A(B(CD))
#
# However, the order in which the product is parenthesized affects the number of simple arithmetic
# operations needed to compute the product. For example, if A is a 10 x 30 matrix, B is a 30 x 5
# matrix, and C is a 5 x 60 matrix, then computing (AB)C needs (10x30x5) + (10x5x60) = 1500 + 3000
# = 4500 operations while computing A(BC) needs (30x5x60) + (10x30x60) = 9000 + 18000 = 27000
# operations. Clearly, the first method is more efficient.

# Solution============================================

def make_empty_table(size):
    # Build a square table of the given size and fill every cell with the number zero.
    table = []
    for row_number in range(size):
        one_row = []
        for column_number in range(size):
            one_row.append(0)
        table.append(one_row)
    return table


def find_best_order(dimensions):
    # The list called dimensions holds the sizes of the matrices.
    # If there are three matrices, this list holds four numbers.
    # Matrix number one is dimensions[0] by dimensions[1].
    # Matrix number two is dimensions[1] by dimensions[2], and so on.
    number_of_matrices = len(dimensions) - 1

    # The cost table remembers the smallest number of operations for each group of matrices.
    cost_table = make_empty_table(number_of_matrices)

    # The split table remembers where we cut each group into two smaller groups.
    split_table = make_empty_table(number_of_matrices)

    # We look at small groups first, then use those answers to solve bigger groups.
    # The variable group_length is how many matrices are in the group we are solving.
    for group_length in range(2, number_of_matrices + 1):

        # The variable start is the first matrix in the group.
        for start in range(0, number_of_matrices - group_length + 1):

            # The variable end is the last matrix in the group.
            end = start + group_length - 1

            # Begin with a very large number so any real answer will be smaller.
            cost_table[start][end] = float("inf")

            # The variable cut is the place where we split the group into a left part
            # and a right part. The left part is start through cut.
            # The right part is cut plus one through end.
            for cut in range(start, end):
                left_cost = cost_table[start][cut]
                right_cost = cost_table[cut + 1][end]

                # Multiplying the left result by the right result costs this many operations.
                joining_cost = dimensions[start] * dimensions[cut + 1] * dimensions[end + 1]

                total_cost = left_cost + right_cost + joining_cost

                # Keep this cut only if it is cheaper than the best cut we have seen so far.
                if total_cost < cost_table[start][end]:
                    cost_table[start][end] = total_cost
                    split_table[start][end] = cut

    return cost_table, split_table


def build_parenthesization(split_table, start, end):
    # If the group holds only one matrix, return the name of that matrix.
    if start == end:
        return "M" + str(start + 1)

    # Otherwise, look up where we cut the group and build the left and right parts.
    cut = split_table[start][end]
    left_part = build_parenthesization(split_table, start, cut)
    right_part = build_parenthesization(split_table, cut + 1, end)
    return "(" + left_part + right_part + ")"


# Run the solution with the example from the problem.
matrix_dimensions = [10, 30, 5, 60]
finished_cost_table, finished_split_table = find_best_order(matrix_dimensions)

last_matrix_index = len(matrix_dimensions) - 2
smallest_cost = finished_cost_table[0][last_matrix_index]
best_grouping = build_parenthesization(finished_split_table, 0, last_matrix_index)

print("Matrix dimensions list:", matrix_dimensions)
print("Smallest number of operations:", smallest_cost)
print("Best parenthesization:", best_grouping)

# Comment =============================================
# The plan is called dynamic programming. It means we solve small pieces first and save the
# answers, so we never solve the same piece twice.
#
# Step one. We store the matrix sizes in one list of numbers. Three matrices need four numbers
# because neighboring matrices share a side.
#
# Step two. We solve every pair of neighboring matrices, because a pair has only one possible
# order. There is nothing to decide.
#
# Step three. We solve every group of three matrices. For each group we try every place we could
# cut it into a left part and a right part. Both parts are already solved, so we just add their
# saved costs plus the cost of joining the two results together.
#
# Step four. We keep growing the group size until the group holds all the matrices. The answer for
# the whole group is the answer to the problem.
#
# Step five. The split table remembers the winning cut for every group. We follow those cuts
# backward to print the parentheses.
#
# Why the joining cost uses three numbers. When we multiply a matrix that is a by b times a matrix
# that is b by c, the work is a times b times c. In the code, a is dimensions[start],
# b is dimensions[cut plus one], and c is dimensions[end plus one].

# Math/Calculations ===================================
# The dimensions list is 10, 30, 5, 60.
# This means matrix one is 10 by 30, matrix two is 30 by 5, and matrix three is 5 by 60.
#
# Groups of two matrices.
# Matrix one times matrix two costs 10 times 30 times 5, which is 1500.
# Matrix two times matrix three costs 30 times 5 times 60, which is 9000.
#
# Group of three matrices. There are two possible cuts.
# Cut after matrix one, which is matrix one times the group of matrix two and matrix three.
#   Left cost is 0. Right cost is 9000. Joining cost is 10 times 30 times 60, which is 18000.
#   Total is 0 plus 9000 plus 18000, which is 27000.
# Cut after matrix two, which is the group of matrix one and matrix two times matrix three.
#   Left cost is 1500. Right cost is 0. Joining cost is 10 times 5 times 60, which is 3000.
#   Total is 1500 plus 0 plus 3000, which is 4500.
#
# The smaller total is 4500, so the winning cut is after matrix two.
# Following that cut gives the grouping ((M1M2)M3).
#
# Amount of work for the whole method. For every group we try every cut, so the running time grows
# with the number of matrices multiplied by itself three times. The tables use the number of
# matrices multiplied by itself two times worth of memory.

# Output ==============================================
# Matrix dimensions list: [10, 30, 5, 60]
# Smallest number of operations: 4500
# Best parenthesization: ((M1M2)M3)
# Problem =============================================
# 130.Find Minimum and Maximum element in an array using minimum comparisons: Given an integer array, find out the minimum and maximum element present using minimum comparisons.
#
# For example,
#
# Input: nums[] = [5, 7, 2, 4, 9, 6] Output: The minimum array element is 2The maximum array element is 9


# Solution============================================

def find_minimum_and_maximum(numbers):
    # If the list has no numbers, there is nothing to find
    if len(numbers) == 0:
        return None, None

    # Set up the starting minimum and maximum, and the starting position
    if len(numbers) % 2 == 0:
        # The count is even, so compare the first two numbers one time
        if numbers[0] < numbers[1]:
            minimum = numbers[0]
            maximum = numbers[1]
        else:
            minimum = numbers[1]
            maximum = numbers[0]
        position = 2
    else:
        # The count is odd, so the first number is both the minimum and the maximum for now
        minimum = numbers[0]
        maximum = numbers[0]
        position = 1

    # Walk through the rest of the list two numbers at a time
    while position < len(numbers):
        smaller = numbers[position]
        larger = numbers[position + 1]

        # One comparison puts the pair in order
        if smaller > larger:
            temporary = smaller
            smaller = larger
            larger = temporary

        # Only the smaller one can beat the minimum
        if smaller < minimum:
            minimum = smaller

        # Only the larger one can beat the maximum
        if larger > maximum:
            maximum = larger

        # Move forward by two positions
        position = position + 2

    return minimum, maximum


numbers = [5, 7, 2, 4, 9, 6]
minimum_value, maximum_value = find_minimum_and_maximum(numbers)
print("The minimum array element is", minimum_value)
print("The maximum array element is", maximum_value)


# Comment =============================================
# The simple way to solve this is to look at every number and compare it to the
# minimum and then compare it to the maximum. That costs two comparisons for
# every number, so it is slower than it needs to be.
#
# The trick here is to take the numbers two at a time. First we compare the two
# numbers in the pair against each other. Now we know which one is smaller and
# which one is larger. The smaller one is the only one that can beat the
# current minimum, and the larger one is the only one that can beat the current
# maximum. So each pair of numbers costs only three comparisons instead of four.
#
# Before the loop starts we handle the beginning of the list. If the count of
# numbers is even, we compare the first two numbers one time and use them as the
# starting minimum and maximum. If the count is odd, we simply use the first
# number as both the starting minimum and the starting maximum, which costs no
# comparison at all. After that the leftover count is always even, so every step
# of the loop always has a full pair to work with.
#
# The variable named temporary is used to swap two values. We save one value in
# temporary so it is not lost while we move the other value into its place.


# Math/Calculations ===================================
# Let n be the count of numbers in the list.
#
# Simple method:
#     Two comparisons for each number after the first one.
#     Total comparisons = 2 times (n minus 1)
#
# Pair method used above:
#     One comparison to order each pair.
#     One comparison of the smaller value against the minimum.
#     One comparison of the larger value against the maximum.
#     That is three comparisons for every two numbers.
#     Total comparisons = 3 times n divided by 2, minus 2
#
# For the example list [5, 7, 2, 4, 9, 6] where n is 6:
#     Simple method:  2 times (6 minus 1) = 10 comparisons
#     Pair method:    (3 times 6) divided by 2, minus 2 = 9 minus 2 = 7 comparisons
#
# Step by step trace of the example:
#     The count 6 is even, so compare 5 and 7. Comparison count is 1.
#         minimum is 5, maximum is 7, position is 2
#     Pair (2, 4). Compare 2 and 4, they are already in order. Comparison count is 2.
#         Compare 2 against minimum 5, so minimum becomes 2. Comparison count is 3.
#         Compare 4 against maximum 7, no change. Comparison count is 4.
#         position is 4
#     Pair (9, 6). Compare 9 and 6, so swap them to get 6 and 9. Comparison count is 5.
#         Compare 6 against minimum 2, no change. Comparison count is 6.
#         Compare 9 against maximum 7, so maximum becomes 9. Comparison count is 7.
#         position is 6
#     The loop ends. minimum is 2 and maximum is 9 after 7 comparisons.
#
# Time taken grows in a straight line with the count of numbers, written as O(n).
# Extra memory used stays the same no matter the count, written as O(1).


# Output ==============================================
# The minimum array element is 2
# The maximum array element is 9
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