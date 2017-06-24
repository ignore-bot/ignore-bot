#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'mysql'

def query(filename)

    token= File.read("oauth.token")
    dbuser = File.read("dbuser.token")
    dbpass = File.read("dbpass.token")
    dbname = File.read("dbname.token")
    table = File.read("tablename.token")
    page = File.read("page_number.txt")

    sql = Mysql::connect("localhost", "#{dbuser}", "#{dbpass}", "#{dbname}");

    uri = URI.parse("https://api.github.com/search/code")
    params = {
        :q => "filename:#{filename} path:/",
        :sort => "indexed",
        :order => "asc",
        :per_page => 100,
        :page => page
    }
    uri.query = URI.encode_www_form(params)

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
        sql.query("INSERT INTO #{table} (full_name, file_name, status) VALUES ('#{name}', '#{filename}', 'fork');")
    end

    page = page.to_i + 1
    File.open("page_number.txt", "w") do |file|
        file.write page
    end

end
