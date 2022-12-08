require 'test/unit'
require 'net/http'
require 'json'

require_relative 'connection.rb'

class TestConnection < Test::Unit::TestCase
  def test_post
    conn = Connection.new("http://example.com")

    Net::HTTP.stub :new, ->(host, port) {
      stubs = Test::Unit::MockObject.new
      stubs.expect :request, Net::HTTPResponse.new(1.1, 200, "OK"), [Net::HTTPRequest]
      stubs
    } do
      response = conn.post("/users", { name: "John", email: "john@example.com" })

      assert_equal 200, response.code
    end
  end

  def test_get
    conn = Connection.new("http://example.com")

    Net::HTTP.stub :new, ->(host, port) {
      stubs = Test::Unit::MockObject.new
      stubs.expect :request, Net::HTTPResponse.new(1.1, 200, "OK"), [Net::HTTPRequest]
      stubs
    } do
      response = conn.get("/users/1")

      assert_equal 200, response.code
    end
  end
end