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
