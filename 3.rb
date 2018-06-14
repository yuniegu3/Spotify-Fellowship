# Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time. 

# Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations. 

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations: 

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢




#Dynamic programming idea from https://www.youtube.com/watch?v=jaNZ83Q3QGc

def changePossibilities (amount, coins) 
  #create array of 0s, with the length of "amount" number
  combinations = Array.new((amount+1), 0)
  combinations[0] = 1
  coins.each do |coin|
    (coin..amount).each do |i|
    stuff = combinations[i] += combinations[i-coin]
    end
  end
  combinations[amount]
end

changePossibilities(4,[1,2,3])
#changePossibilities(12,[1,2,5])
