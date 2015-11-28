dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def substrings(word, dictionary)
	word_array = word.split(' ')
	results = {}
	
	dictionary.each do |entry|
        count = 0
		word_array.each do |term|
		    term = term.downcase
			if term.include? entry
				count += 1
				results[entry] = count
			end
		end
	end
	return results
end

p substrings("Howdy, partner! How are y'all doing down here? It's going to be a low down good time.", dictionary)
