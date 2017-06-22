# Improving Documentation

## Questions I had when reading over documentation
- How in-depth do we want the documentation to be?
- Do we want it to be more beginner friendly and more accessible? If so, to what extent?


## [`Development setup` section](https://github.com/bundler/bundler/blob/master/doc/development/SETUP.md)
- On the [`Development setup` section](https://github.com/bundler/bundler/blob/master/doc/development/SETUP.md) instructions, I think depending on how in-depth we want the documentation to be, we could include a Zero-th step that talks about Forking the repo, and cloning the fork to your machine.
 [This](https://help.github.com/articles/fork-a-repo/) is a good tutorial about forking that we could link to.
- Possibly include how to add aliases to your `~/.bashrc` profile. [Here](https://www.moncefbelyamani.com/create-aliases-in-bash-profile-to-assign-shortcuts-for-common-terminal-commands/) is an explanation of how to go about adding `aliases`.
- Can Windows users contribute to `bundler`? I noticed there is no specific set-up directions for Windows users. If bundler does not support Windows users, should bundler recommend Windows users to dual-boot with Ubuntu instead?
- Alongside that note, what about Cygwin users? Putting contributing to `bundler` aside, can Cygwin users even use bundler...? I saw on [`npm`'s Readme](https://github.com/npm/npm) that their directions for installing `npm` on Cygwin is just "No."
- I haven't seen any directions yet on uninstalling bundler. Should we include `gem uninstall bundler` somewhere?

## [`bundle install` section](http://bundler.io/v1.15/man/bundle-install.1.html)

- On the `bundle install` page of documentation, we could add some clarify on the `--frozen` option. Currently it says, `Exits non-zero if there are going to be changes to the Gemfile.lock.`. We could add a sentence explaining how a non-zero exit is an exit with an error, while a zero exit is a successful exit.  
- Is there a particular order in which the flags appear? At first, it seemed alphabetical to me, but it's actually not. Is it in order of importance? If not, should it be re-ordered so that it's alphabetical, instead?
- When explaining the `binstubs` flag, it could be helpful to explain what `binstubs` are. We could link to a more in-depth explanation. I found [this](https://github.com/rbenv/rbenv/wiki/Understanding-binstubs) blurb about binstubs in the rbenv docs beneficial. This goes for the same for [`bundle binstubs`](http://bundler.io/v1.15/man/bundle-binstubs.1.html) under the `Utilities` section.


-
