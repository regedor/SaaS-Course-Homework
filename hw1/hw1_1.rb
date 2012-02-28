def palindrome?(string) 
  normalized_string = string.gsub(/\W/,"").downcase
  return normalized_string == normalized_string.reverse  
end

def count_words(string) 
  string.downcase.split(/\b/).inject(Hash.new(0)) { |h, word| h[word] += 1 if word =~ /\w/ ; h }
end