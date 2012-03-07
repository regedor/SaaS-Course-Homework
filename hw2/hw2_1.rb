class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *arguments)
    begin
      return(self / @@currencies[arguments.first.to_s.gsub( /s$/, '')]) if method_id.to_s == "in"
      return(self * @@currencies[method_id.to_s.gsub( /s$/, '')])
    rescue TypeError
      super
    end
  end
end

class String
  def palindrome? 
    string = self.gsub(/\W/,"").downcase
    return string == string.reverse  
  end
end

module Enumerable
  def palindrome? 
    a = self.to_a
    1.upto(a.size/2) { |i| return false unless a[i-1] == a[0-i] }
    return true
  end
end
