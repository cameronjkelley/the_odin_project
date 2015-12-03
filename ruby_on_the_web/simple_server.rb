require 'socket'
require 'json'

server = TCPServer.new('localhost', 3000)

loop {
  socket = server.accept
  request = socket.gets
  request_header, request_body = request.split("\r\n\r\n", 2)
  method = request_header.split[0]
  path = request_header.split[1]
  file = path.split("/")[-1]

  if File.exist?(file) && !File.directory?(file)
    response_body = File.read(file)
    socket.puts "HTTP/1.1 200 OK\r\nContent-type:text/html\r\n\r\n"
    if method == "GET"
      socket.puts response_body
    elsif method == "POST"
      params = JSON.parse(request_body)
      vikings = ""
      params['viking'].each { |key, value| vikings += "<li>#{key}: #{value}</li>\n" }
      socket.puts response_body.gsub('<%= yield %>', vikings)
    end
  else
    socket.puts "HTTP/1.1 404 Not Found\r\n\r\n"
    socket.puts "404 Error, File could not be found"
  end
  socket.close
}