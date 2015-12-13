def caesar_cipher(message, shift)
	code_array = []
	msg_array = message.split('')

	alphabet = ('a'..'z').to_a

	cap_alphabet = ('A'..'Z').to_a

	msg_array.each do |char|

		if alphabet.index(char)
			match = alphabet.index(char)
			if (match + shift) < alphabet.length - 1
				code_array.push(alphabet[match + shift])
			else
				code_array.push(alphabet[shift - match - 2])
			end

		elsif cap_alphabet.index(char)
			match = cap_alphabet.index(char)
			if (match + shift) < cap_alphabet.length - 1
				code_array.push(cap_alphabet[match + shift])
			else
				code_array.push(cap_alphabet[shift - match - 2])
			end

		else
			code_array.push(char)
		end
	end
	code_array.join
end