require 'json'
require_relative 'http/connection.rb'

url = "here"
conn = Connection.new(url)

response = conn.get("/args/ff345", # { body: []}
)

puts response.body # => returns center information