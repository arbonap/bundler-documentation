$ ruby -rbundler/setup -e 'puts Gem.bin_path("bundler", "bundler"); puts ENV["PATH"]'

# Will return something like:
# /Users/Patricia/.rvm/gems/ruby-2.4.1/gems/bundler-1.15.4/exe/bundler
# /Users/Patricia/.rvm/gems/ruby-2.4.1/bin:/Users/Patricia/.rvm/gems/ruby-2.4.1@global/bin:/Users/Patricia/.rvm/rubies/ruby-2.4.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Patricia/.rvm/bin

# bin_path(name, exec_name = nil, *requirements) public
# Find the full path to the executable for gem name. If the exec_name is not given, the gem’s default_executable is chosen, otherwise the specified executable’s path is returned. requirements allows you to specify specific gem versions.

# use magical comment in Ruby < 2 to handle utf-8/unicode : # encoding: utf-8
# ruby < 2 defaulted to interpreting source as ASCII, ruby 2+ default to utf8. Ruby < 2 handled unicode just fine, it just didn't default to it
