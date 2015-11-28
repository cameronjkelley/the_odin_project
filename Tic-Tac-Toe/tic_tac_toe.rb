module TicTacToe

	class Grid	
		attr_accessor :grid, :cells

		def initialize
			@grid = [
				["1", "|", "2", "|", "3"],
				["-", "|", "-", "|", "-"],
				["4", "|", "5", "|", "6"],
				["-", "|", "-", "|", "-"],
				["7", "|", "8", "|", "9"]
			]
			@cells = (1..9).to_a
		end

		def print_grid
			@grid.each { |row| puts row.join(" ") }
		end

	end


	class Game
		@@wins = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]]
		attr_accessor :game_grid, :turns, :player1, :player2
		
		def initialize
			@game_grid = Grid.new
			@turns = 9
			@player1 = whose_playing(1)
			@player2 = whose_playing(2)
			instructions
			play
		end

		Player = Struct.new(:name, :mark, :moves)

		def whose_playing(z)
			mark = ""
			z == 1 ? mark = "X" : mark = "O"
			puts "\nPlayer #{z} enter your name: "
			print ">> "
			return Player.new(gets.chomp, mark, [])
		end

		
		def instructions
			puts "\nLet's play Tic Tac Toe!"
			puts "\nThe grid is set up just like a telephone keypad:"
			@game_grid.print_grid
			puts "Just enter 1-9 to put your mark."
		end

		
		def play
			begin
				player = whose_turn
				puts "\nYour turn, #{player.name}."
				print ">> "
				cell_played = gets.chomp
				a_turn(player, cell_played)
			end until win? || cat?
				play_again
		end

		
		def win?
			player = whose_turn
			@@wins.each do |win|
				three_in_a_row = 0
				player.moves.each do |move|
					if win.include?(move.to_i)
						three_in_a_row += 1 
					end
					if three_in_a_row == 3
						puts "#{player.name} wins! Congratulations!"
						return true
					end
				end
			end
			@turns -= 1
			return false
		end

		
		def cat?
			if @turns == 0 && !win?
				puts "CAT!"
				return true
			else
				return false
			end
		end

		
		def whose_turn
			@turns % 2 != 0 ? @player1 : @player2
		end

		
		def a_turn(x, y)
			if @game_grid.cells.include?(y.to_i)
				@game_grid.cells.delete(y.to_i)
				x.moves << y
				update_grid(y)
			else 
				puts "That's an invalid move. Please enter the number of an open cell."
				print ">> "
				z = gets.chomp
				a_turn(x, z)
			end
		end

		# refactor as conditional using ranges?
		def update_grid(y) 
			a, b = "", ""
			case
			when y == "1" then a, b = 0, 0
			when y == "2" then a, b = 0, 2 
			when y == "3" then a, b = 0, 4
			when y == "4" then a, b = 2, 0 
			when y == "5" then a, b = 2, 2
			when y == "6" then a, b = 2, 4
			when y == "7" then a, b = 4, 0
			when y == "8" then a, b = 4, 2
			else a, b = 4, 4
			end
			@game_grid.grid[a][b] = whose_turn.mark
			@game_grid.print_grid
		end


		def play_again
			puts "Want to play again? Y or N"
			print ">> "
			response = gets.chomp.upcase
			if response == "Y"
				Game.new.play
			elsif response == "N"
				puts "Thanks for playing."
			else
				puts "What? Well, thanks for playing."
			end
		end

	end
end

TicTacToe::Game.new
