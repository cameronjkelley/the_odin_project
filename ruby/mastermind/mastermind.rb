module Mastermind

	class Game
		@@peg_colors = ["red", "orange", "yellow", "green", "blue", "violet"]
		
		def initialize
			instructions
			@turns = []
			@hints = []
			@code = encrypt
			play
		end

		def player_code
			code = []
			puts "\nEnter four colors for your pegs." 
			print ">> "
			pegs = gets.chomp.split(//)
			pegs.each { |peg| /[roygbv]/.match(peg) != nil ? code << peg : redo }
			code
		end

		def instructions
			puts "MASTERMIND!"
			sleep 1
			puts "\nYou have 8 turns to crack the code.\nThe code is four pegs long.\nEach peg is one of six colors.\nEach color can be used more than once."
			sleep 5
			puts "\nYou will receive feedback after each guess:\nAn 'X' is an incorrect peg\nand a slash, '/', means your peg's color is correct\nbut in the wrong position."
			sleep 5 
			puts "\nAlright mastermind, let's play!"
			sleep 2
			print_colors
		end

		def lose?
			@turns == 0 ? true : false
		end

		def encrypt
			code = []
			4.times { code << @@peg_colors[rand(0..5)][0] }
			code
		end

		def play
			begin	
				x = player_code
				@turns << x
				print_board(x)
			end until win?(x) || lose?
			play_again
		end

		def play_again
			puts "\nWant to play again? Y or N"
			print ">> "
			gets.chomp.upcase == "Y" ? Game.new : exit
		end

		def print_board(x)
			puts "======="
			hint = []
			x.each_with_index do |color, idx|
				@code.include?(color) ? (color == @code[idx] ? hint << color : hint << "/") : hint << "X"
			end
			@hints << hint
			@hints.each { |x| puts x.join(" ") }
			(8 - @turns.length).times { puts "_ _ _ _" }
			puts "======="
		end

		def print_colors
			puts "\nThe colors are:"
			@@peg_colors.each { |color| puts "(" + color[0] + ")" + color[1..-1] }
		end

		def win?(x)
			if x == @code 
				puts "\nYou cracked the code! Congratulations!"
				return true  
			else
				puts "\nTurns left: #{8 - @turns.length}"
				print_colors
				return false
			end
		end
	end
end

Mastermind::Game.new
