# Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

#thought process:
# split the strings
# have a compare where each time there is a match, logs that letter into the empty string

def sortByStrings (s,t)
  sortedStr = ""
    s_arr = s.split('')  
    t_arr = t.split('')

    for tchar in t_arr
    for schar in s_arr
      if tchar == schar
      sortedStr += schar
    end
  end
  end
return sortedStr
end


sortByStrings("weather", "therapyw")
# sortByStrings("good", "odg")



# Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string. 

# The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer. 

# For s = "4[ab]", the output should be decodeString(s) = "abababab" 
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

# this could probably get cleaned up quite a lot...
#my thought process was to get everything seperated into a array
#thought about using regex to get [ placement..but felt like it could be done without (dont know if that is a smart idea tho) 
# i felt like I can use stack process to sort this out, hence the reason why there are pop methods in the end.
# the stack method that i thought of was having 2 array(stack), one holding all numbers and 1 holding all letters(including bracket), i wanted to make a condition where if you popped and it was a closed bracket, it will pop until it finds a open bracket, the letter(s) that were popped off during the process will be saved in a variable. Once it finds a open bracket, it will pop from the num array(stack) and multiply the saved variable with it. And it will repeat until stack is emptied. I could not get this to work 100%
# i saw that last letter is always multiplied by the last number...this solution will not work however, if there is more then 1 letter/number (ex: 3[a3[b4[cd]]] )


def decodeString (s)
  s_arr = s.split(//)
  nums = []
  res = [] # ["a", "b"]
 
  for char in s_arr
    # if char == "[" 
    #   num = s_arr.index(char)-1
    #   num = s_arr.fetch(num) #2
    #   puts num
      if char >= "0" && char <= "9"
          num = char.to_i
          nums.push(num)
          puts "#{nums} im first if statement"
      elsif char == "a" or char == "b" or char == "c"
      # if res == null
        res.push(char)
        puts "#{res} im in 2nd if statement"
        # puts "#{res} im in elsif statement (res)"
        # puts "#{res * num} in the elsif (res)"
      else 
        # puts "im a bracket probably"
      end
    # puts "#{num} im in the for loop"
    # puts "#{res * num} im in the for loop too"
  
    end

      if nums.length == 3
      num = nums.pop
      num2 = nums.pop
      num3 = nums.pop
      letter = res.pop
      letter2 = res.pop
      letter3 = res.pop
      arr = letter * num
      arr2 = letter2 * num2

      return (letter3 + arr2 + arr) * num3 
      
      elsif nums.length == 2
        num = nums.pop
        num2 = nums.pop
        letter = res.pop
        letter2 = res.pop
        arr = letter * num
        return (letter2 + arr) * num2
      elsif nums.length == 1
        num = nums.pop
        res = res.join
        # puts "is this hitting?"
        return (res * num)
      end
    
end
#return #res.join * nums
  
  #["a","a","a"]
  #["b", "b"]

decodeString("4[ab]") #abababab
#decodeString("2[b3[a]]") #baaabaaa
#decodeString("3[a3[b4[c]]]") #abbbccccabbbcccc




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
