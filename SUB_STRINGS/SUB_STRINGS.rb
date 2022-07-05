def sub_strings(string, dictionary) 
  hash = Hash.new(0);
  string = string.downcase

  dictionary.each do |word|
    count = string.scan(/(?=#{word})/).count
    if count > 0
      hash[word] = count
    end
  end
  p hash
end

# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# sub_strings("Howdy partner, sit down! How's it going?", dictionary)