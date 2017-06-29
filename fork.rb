#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'mysql'

def fork()

    token= File.read("oauth.token")
    dbuser = File.read("dbuser.token")
    dbpass = File.read("dbpass.token")
    dbname = File.read("dbname.token")
    table = File.read("tablename.token")
    
    sql = Mysql::connect("localhost", "#{dbuser}", "#{dbpass}", "#{dbname}")

    result = sql.query("SELECT full_name FROM repos WHERE status = 'fork' LIMIT 1;")
    name = result.fetch_row()
    
    puts name

    #edit SQL entry here

    # TEMPORARY DEBUGGING
    name = "karagenit/ignore-bot"

    uri = URI.parse("https://api.github.com/repos/#{name}/forks?organization=ignore-bot")

    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "bearer #{token}"

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
    end

    json = JSON.parse(response.body)

    puts response.message #expect 202 Accepted

end
