# Bundler Notes
## `bundle install`
- if this is the first time ran & `Gemfile.lock` doesn't exist, Bundler fetches all remote sources, resolves dependencies, & installs needed gems
- if `Gemfile.lock` exists, & you have *not* updated your `Gemfile`,  Bundler fetches remote sources but uses dependencies specified in `Gemfile.lock` instead of resolving dependencies
- if `Gemfile.lock` does exist, & you've updated the `Gemfile`, Bundler uses dependencies in Gemfile.lock for all gems you did not update, but will *re-resolve* dependencies of gems that you did update.

## `bundle install` options
- You can use `bundle config` to apply any of these options: `--deployment`, `--path`, `--binstubs`, `--without`
- `--binstubs[=<directory>]` creates a directory (defaults to `~/bin`) and places executables from the gem there. These executables run in Bundler's context. If you want, you could add this directory to your env's `PATH` variable.
- For instance, if the `rails` gem comes with a `rails` executable, this flag will create a `bin/rails` executable that ensures that all referred dependencies will be resolved using the bundled gems.
- `--clean`: on finishing installation, Bundler removes any gems not present in current Gemfile. Gems currently in use won't be removed.
- `--full-index` doesn't call the Rubygems' API endpoint, which it does by default normally, but rather downloads and aaches a big index files of all gems. This improves performance for large bundles that seldomly change by enabling this option.
- `--local` doesn't attempt to connec tto `rubygems.org`. bundler will use gems already in Rubygems' cache or in `vender/cache`.
- Never `sudo bundle install` because 1. the current user should be updating your current Gemfile.lock, updating your `vendor/cache`, as well as checking out private git repos
- By default Bundler installs gems to the same place as `gem install`
- Bundler offers a rock-solid guarantee that the third-party code you are running in development and testing is also the third-party code you are running in production.
- `Installing Groups`: This means that you cannot include different versions of the same gem in different groups, because doing so would result in different sets of dependencies used in development and production.
- `Binstubs` are wrapper scripts around executables (sometimes referred to as "binaries", although they don't have to be compiled) whose purpose is to prepare the environment before dispatching the call to the original executable.

# [Getting Started - Installing Bundler and bundle init] (http://bundler.io/v1.15/guides/using_bundler_in_applications.html)
```
$ mkdir bundler_example && cd bundler_example
$ bundle init
```
- similar to `npm init`

- `# frozen_string_literal: true` is a magic comment, supported for the first time in Ruby 2.3, that tells Ruby that all string literals in the file are implicitly frozen, as if #freeze had been called on each of them
- freezing strings feature improves app performance by freezing strings. Matz will make all string literals immutable by default in Ruby 3.0
- The static string literals will be frozen and always returns same object.

 _Sources_
 - An auto-generated Gemfile will search for gems in `https://rubygems.org`. Alternatively, if you'd like to use your own RubyGems server or a different one, you can change it like so:

 - ``` source "https://your_ruby_gem_server.url" do

 end
 ```

- or like so `gem "my_gem", source: "https://your_2_ruby_gem_server.url"
`
`gem "some_internal_gem", :source => "https://gems.example.com"`
- This forces the gem to be loaded from this source and ignores any global sources declared at the top level of the file. If the gem does not exist in this source, it will not be installed.


_Adding Gems_
- if you want to install the latest version of a gem, just don't specify any version number in the gemfile
- for specific version, specify it after a comma
- You can also use this syntax:
```
gem "rails", "~> 4.0.0" # which is same as gem "rails", ">= 4.0.0", "< 4.1.0"
gem "nokogiri", ">= 1.4.2"
```

## `Gemfile.lock`

- ```
GEM
  remote: https://rubygems.org/
  specs:
    mini_portile2 (2.1.0)
    nokogiri (1.6.8)
      mini_portile2 (~> 2.1.0)
      pkg-config (~> 1.1.7)
    pkg-config (1.1.7)

PLATFORMS
  ruby

DEPENDENCIES
  nokogiri (>= 1.4.0)

BUNDLED WITH
   1.12.5
```


# (Setting up your App to use Bundler)[http://bundler.io/bundler_setup.html#setting-up-your-application-to-use-bundler]

- Bundler makes sure Ruby can find its gems in `Gemfile` and all of their dependencies.
- Rails has code necessary to invoke bundler
- For a Sinatra app, you must first setup bundler before requiring any gems.
```
require 'rubygems'
require 'bundler/setup'
```
This will automatically discover your Gemfile, and make all of the gems in your Gemfile available to Ruby (in technical terms, it puts the gems "on the load path"). You can think of it as an adding some extra powers to require 'rubygems'.

Source Priority
When attempting to locate a gem to satisfy a gem requirement, bundler uses the following priority order:

The source explicitly attached to the gem (using :source, :path, or :git)
For implicit gems (dependencies of explicit gems), any source, git, or path repository declared on the parent. _This results in bundler prioritizing the ActiveSupport gem from the Rails git repository over ones from rubygems.org_
The sources specified via global source lines, searching each source in your Gemfile from last added to first added.

```
install_if -> { RUBY_PLATFORM =~ /darwin/ } do
  gem "pasteboard"
end
```

Only update the gems in the specified group. For instance, you can update all gems in the development group with `bundle update --group development`. You can also call `bundle update rails --group test` to update the rails gem and all gems in the test group, for example.

`bundle update --conservative
Use bundle install conservative update behavior and do not allow shared dependencies to be updated.`

## [How does Bundler work anyway](http://andre.arko.net/2015/04/28/how-does-bundler-work-anyway/)

## Ruby's `eval`

- ``` Ruby’s eval takes in a string as the argument, which means that it is possible for one to accept user input or read code off of a file and get it evaluated from within your program - essentially re-programming the way your program behaves. ```


- What does `.gemspec` do? ["Developing a RubyGem using Bundler" Guide](https://bundler.io/v1.13/guides/creating_gem):
  - ``` foodie.gemspec: The Gem Specification file. This is where we provide information for Rubygems’ consumption such as the name, description and homepage of our gem. This is also where we specify the dependencies our gem needs to run.
  ```
