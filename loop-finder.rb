#!/usr/bin/env ruby

require_relative 'lib/finder.rb'
require_relative 'lib/reader.rb'

unless ARGV.length == 1
  puts "Usage: #{$PROGRAM_NAME} pipeline.yml"
  exit 1
end

first_loop = Finder.new(Reader.new).find(ARGV[0])
if first_loop.empty?
  exit 0
else
  puts first_loop.join('->')
  exit 1
end
