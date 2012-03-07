def combine_anagrams(words)
  words.map { |w| [w.downcase.split(//).sort.join,w] }.group_by(&:first).values.map { |a| a.map &:last }
end


