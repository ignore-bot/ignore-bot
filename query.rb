#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'mysql'

token= File.read("oauth.token")
dbuser = File.read("dbuser.token")
dbpass = File.read("dbpass.token")

sql = Mysql::connect("localhost", "#{dbuser}", "#{dbpass}", "ignore_bot");

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

json["items"].each do |item| 
    name = item["repository"]["full_name"] 
    sql.query("INSERT INTO repositories (full_name) VALUES ('#{name}');")
end

puts sql::query("SELECT * FROM repositories")::num_rows();
