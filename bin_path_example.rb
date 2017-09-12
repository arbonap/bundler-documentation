$ ruby -rbundler/setup -e 'puts Gem.bin_path("bundler", "bundler"); puts ENV["PATH"]'

# Will return something like:
# /Users/Patricia/.rvm/gems/ruby-2.4.1/gems/bundler-1.15.4/exe/bundler
# /Users/Patricia/.rvm/gems/ruby-2.4.1/bin:/Users/Patricia/.rvm/gems/ruby-2.4.1@global/bin:/Users/Patricia/.rvm/rubies/ruby-2.4.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Patricia/.rvm/bin

# bin_path(name, exec_name = nil, *requirements) public
# Find the full path to the executable for gem name. If the exec_name is not given, the gem’s default_executable is chosen, otherwise the specified executable’s path is returned. requirements allows you to specify specific gem versions.

# use magical comment in Ruby < 2 to handle utf-8/unicode : # encoding: utf-8
# ruby < 2 defaulted to interpreting source as ASCII, ruby 2+ default to utf8. Ruby < 2 handled unicode just fine, it just didn't default to it

# ls source/**/*.md - recursively search through file system for files ending with markdown extension within the source directory
# Pathname library:
path.directory?
path.exist?
path.readable?
path.writable?

# Let’s imagine that you have the following folder structure:
#
# lib/
#   + script.rb
# data/
#   + file.txt
# You want to access file.txt from your script.rb script,
# but you want to make sure that this works whatever working directory you
# run the script from. That means you need to figure out what the
# absolute path to file.txt is, and then reference it using this absolute path.


pn = Pathname.new('/usr/bin/ruby')
pn.file?       # => true
pn.directory?  # => false

pn.absolute?   # => true
pn.relative?   # => false

pn.executable? # => true
pn.readable?   # => true
pn.writable?   # => false

pn.root?       # => false

Pathname.glob('**/*.rb') # like Dir['**/*.rb'] but returns Pathnames instead of files strings (?maybe i think?)

# path = Pathname(__FILE__).dirname.parent + "data" + "some_file"

# $1, $2, ...	The match for the first, second, etc. parenthesized groups in the last regular expression.
