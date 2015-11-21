require 'rest-client'

url = 'http://localhost:3000/users/'

def prompt
  puts "What action would you like to perform?"
  puts "(I)ndex\t(C)reate(N)ew"
  puts "(E)dit\t(S)how\t(U)pdate"
  puts "(D)estroy"
end

prompt
action = gets.chomp.upcase

case action
when "I"
  puts RestClient.get(url)
when "N"
  puts RestClient.get(url + "new")
when "E"
  puts RestClient.get(url + "1/edit")
when "S"
  puts RestClient.get(url + "1")
when "U"
  puts RestClient.post(url, "1")
when "C"
  puts RestClient.post(url, "")
when "D"
  puts RestClient.delete(url)
else
  prompt
end