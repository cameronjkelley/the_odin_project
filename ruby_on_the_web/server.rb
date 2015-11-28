require "socket"
require "uri"
require "json"

server = TCPServer.new(3000)

loop do
  socket = server.accept
 
  # if GET display index.html
    client.puts(index.html)
  #else 
    # parse JSON 
    # insert into thanks.html and return to client

    
    client.puts
    client.close
  end
end