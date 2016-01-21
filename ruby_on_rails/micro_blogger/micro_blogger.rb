require "jumpstart_auth"
require "bitly"

Bitly.use_api_version_3

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing..."
		@client = JumpstartAuth.twitter
	end


	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message

		screen_names =  @client.followers.collect { |follower| @client.user(follower).screen_name }
		if screen_names.include?(target)
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "#{target} is not one of your followers. You can only send direct messages to your followers."
		end
	end


	def everyones_last_tweet
		friends = @client.friends.sort_by { |friend| friend.screen_name }
		friends.each do |friend|
			timestamp = friend.status.created_at
			last_tweet = friend.status.text
			puts "#{friend.screen_name} said this on #{timestamp.strftime("%A, %b %d")}..."
			puts last_tweet
			puts ""
		end
	end


	def followers_list
		screen_names = []
		@client.followers.each { |follower| screen_names << follower.screen_name.downcase }
		screen_names
	end


	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
			when "dm" then dm(parts[1], parts[2..-1].join(" "))
			when "elt" then everyones_last_tweet
			when "q" then puts "Goodbye!"
			when "shorten" then shorten(parts[-1])
			when "spam" then spam_my_followers(parts[1..-1].join(" "))
			when "t" then tweet(parts[1..-1].join(" "))
			when "turl" then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			else
				puts "Sorry, I don't know how to #{command}."
			end
		end
	end


	def shorten(original_url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		puts "Shortening this URL: #{original_url}"
		bitly.shorten(original_url).short_url
	end


	def spam_my_followers(message)
		list = followers_list
		list.each { |follower| dm(follower, message) }
	end


	def tweet(message)
		if message.length < 141
			@client.update(message)
			puts "Your message was succesfully posted."
		else
			puts "Your message is more than 140 characters long."
		end
	end
end

blogger = MicroBlogger.new
blogger.run