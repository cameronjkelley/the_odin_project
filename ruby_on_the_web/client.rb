require "socket"
require "json"

socket = TCPSocket.new("localhost", 3000)

method = ""
until method == "GET" || method == "POST"
  puts "GET or POST?"
  method = gets.chomp.upcase
end

if method == "GET"
  socket.puts "GET /index.html HTTP/1.1"
else 
  puts "What's your name?"
  name = gets.chomp
  puts "Want to know when the next raid'll be? Give us your email."
  email = gets.chomp
  hash = {:viking => {:name => name, :email => email}}
  content = hash.to_json
  socket.print "POST  HTTP/1.1\r\n" +
               "Content-Length: #{content.length}\r\n" +
               "\r\n" +
               "#{content}"
end

socket.close