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