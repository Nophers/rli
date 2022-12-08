require 'net/http'

class Connection
  def initialize(base_url)
    @base_url = base_url
  end

  def post(url, body = {})
    uri = URI(@base_url + url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)
    request.body = body.to_json
    http.request(request)
  end

  def get(url)
    uri = URI(@base_url + url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri)
    http.request(request)
  end
end

