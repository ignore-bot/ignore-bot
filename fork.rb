#!/usr/bin/env ruby

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
    #fork #{name} here

end
