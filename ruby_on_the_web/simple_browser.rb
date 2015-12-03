require 'socket'
require 'json'

host = 'localhost'
port = 3000

request = ""

until request == "G" || request == "P"
  puts "[G]ET or [P]OST request?"
  request = gets.chomp.upcase
end

if request == "P"
  puts "Enter your name: "
  name = gets.chomp
  puts "Enter your email: "
  email = gets.chomp
  params = Hash.new { |h, k| h[k] = Hash.new }
  params[:viking][:name] = name
  params[:viking][:email] = email
  request = "POST /thanks.html HTTP/1.1\r\nContent-Length: #{params.to_json.length}\r\n\r\n#{params.to_json}"
else
  request = "GET /index.html HTTP/1.1\r\n\r\n"
end

socket = TCPSocket.open(host, port)           # connect to server
socket.print(request)                         # send request
response = socket.read                        # read complete response
headers, body = response.split("\r\n\r\n", 2) # split response at first blank line into headers and body
print body
socket.close