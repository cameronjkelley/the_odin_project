require 'yaml'

class Game

	def initialize
		@letters = ('a'..'z').to_a
		@word = secret_word
		@display = Array.new(@word.length, '_')
		@used_letters = []
		@chances = 8
	end

	def secret_word
		dictionary = File.read("dictionary.txt").split
		word = dictionary[rand(0...dictionary.length)]
		word.length < 12 && word.length > 5 ? word.split(//) : secret_word
	end

	def play
		puts "\nTo save your neck, you have to guess the secret word.\nYou have #{@chances} chances to do so.\nAlright, deadman, let's play."
		begin
			guess = prompt
			compare(guess)
			print_used_letters(guess)
			@chances -= 1
			puts "Chances left: #{@chances}"
		end until win? || lose?	
		play_again	
	end

	def intro
		puts "HANGMAN!"
		puts "Would you like to start a (n)ew game or (l)oad a saved game? "
		gets.chomp == "l" ? load_game : Game.new.play
	end

	def load_game
		game = YAML.load(File.read("save.yml"))
		@word = game[0]
		@display = game[1]
		@used_letters = game[2]
		@chances = game[3]
		puts "#{@display}\nLetters used: #{@used_letters}\nChances left: #{@chances}"
		play
	end

	def prompt
		puts "\nGuess a letter or type 'save' to save your game and exit: "
		guess = gets.chomp.downcase
		if @letters.include?(guess)
			@letters.delete(guess)
			return guess
		elsif guess == "save"
			save_game
		else
			puts "Try again."
			prompt
		end 
	end
	
	def compare(guess)
		@word.each_with_index do |letter, idx|
			if letter.downcase == guess
				@display[idx] = letter
				@chances += 1
			end
		end
		puts @display.join
	end

	def print_used_letters(letter)
		@used_letters << letter
		puts "Letters used: #{@used_letters.join(" ")}"
	end

	def win?
		if @display == @word
			puts "\nYou've used your brain to save your neck.\nCongratulations."
			return true
		else
			return false
		end
	end

	def lose?
		if @chances == 0 
			puts "Couldn't figure out '#{@word.join}'?\nYou really are a dead man now."
			return true
		else
			return false
		end
	end

	def play_again
		puts "\nWant to play again? Y or N"
		gets.chomp.upcase == "Y" ? Game.new.play : puts("Thanks for playing.")
	end

	def save_game
		game = [@word, @display, @used_letters, @chances]
		File.open("save.yml", 'w')  { |x| x.write(YAML.dump(game)) }
		exit
	end
end

Game.new.intro
