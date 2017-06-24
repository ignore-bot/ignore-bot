#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'mysql'

token= File.read("oauth.token")
dbuser = File.read("dbuser.token")
dbpass = File.read("dbpass.token")

uri = URI.parse("https://api.github.com/search/code?q=filename:.DS_Store+path:/&sort=indexed&order=asc")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "bearer #{token}"

req_options = {
    use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
end

json = JSON.parse(response.body)

json["items"].each { |item| puts item["repository"]["full_name"] }

sql = Mysql::connect("localhost", "#{dbuser}", "#{dbpass}", "ignore_bot");

puts sql.server_info()
