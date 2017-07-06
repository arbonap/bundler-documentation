#!/usr/bin/env ruby

 Dir.glob('*.rb').each do |f|
 puts f
 end

p Dir.glob('*.rb')
p Dir.glob('*.rb').first

p Dir.home
p Dir.home("root")

p Dir.new("potatoes")
 #this matches all files with the ending `.rb`

# globbing files means you can use regular expression like pattern matching to select/match the files you want
# the opposite, which is iterating over all files in a directory, can be done with the Dir.foreach method
# p Dir.pwd same as Dir.getwd
#

# Dir.chdir "../../Documents" ==> will change your cwd to up 2 levels and to Documents

# gives you the absolute path of a file. The argument given is the file name and extention in a string.
File.absolute_path "glob_example.rb" # => "/users/andrew/Documents/plans.txt"

#__FILE__ means where you are right now
