#!/usr/bin/env ruby

require './query.rb'
require './fork.rb'

# this file to be called hourly by cron
# TODO for each oauth token

File.open("ignore_files.txt").each do |line|
    query(line)
end

fork()
