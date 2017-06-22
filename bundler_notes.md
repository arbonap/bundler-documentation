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
- Binstubs are wrapper scripts around executables (sometimes referred to as "binaries", although they don't have to be compiled) whose purpose is to prepare the environment before dispatching the call to the original executable.
