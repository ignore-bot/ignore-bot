#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'

token= File.read("oauth.token")

uri = URI.parse("https://api.github.com/search/code?q=filename:.DS_Store")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "bearer #{token}"

req_options = {
    use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
end

json = JSON.parse(response.body)

puts json["total_count"]
