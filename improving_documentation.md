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

______
### Second round of documentation feedback ✨

## [Getting Started - Installing Bundler and bundle init](http://bundler.io/v1.15/guides/using_bundler_in_applications.html)

The following things are _super_ nitpicky of me:
- In this section, I think adding an `an` in front of `already` would make this sentence a little more clear:
- " This command will also update _an_ already installed bundler. You should get something similar as output: "
I think this sentence can be expanded a little bit:
- " To init Bundler manually, let’s do this (bundler_example will be folder with our app):"
- This sentence should be more along the lines of, "To initialize Bundler manually, use the `bundle init` command in the directory your app lives in. To illustrate, imagine `bundler example` is the directory with our app:"
```
$ mkdir bundler_example && cd bundler_example
$ bundle init
```
- Also, for this sentence, I think it would be wonderful if we could add an article and a few prepositions: "This will create _a_ Gemfile inside _of our_ bundler_example folder:"

## In the [gemfile](http://bundler.io/man/gemfile.5.html) section,
- in the [Platforms section](http://bundler.io/man/gemfile.5.html#PLATFORMS), I think it could be useful to insert a short sentence or two explaining that Ruby has three different interpreters, and linking the reader to more in-depth explanations of each: [MRI (also known as CRuby)](https://en.wikipedia.org/wiki/Ruby_MRI), [Rubinius](https://rubinius.com/), and [JRuby](http://jruby.org/).
- Before this, I personally had thought Ruby was only written in C. I also didn't realize what MRI was referring to for a while, it definitely took me some time. The first thing that came to mind was that MRI was referring to Magnetic Resonance Imaging 😅. Only later did I realize that Ruby written in C is called MRI because it's "Matz's Ruby Interpreter" 😆. I was totally confused as to why Rubyists would be talking about body scans 😂..... Now I know better.

- in the [Git section](http://bundler.io/man/gemfile.5.html#GIT), It would be rad for there to be an example of how to use the `branch`, `tag`, and `ref` options

- It would be helpful for myself to have a link explaining that a [`git submodule`](https://git-scm.com/book/en/v2/Git-Tools-Submodules) is git module within another git repository.

- in the [Gemspec](http://bundler.io/man/gemfile.5.html#GEMSPEC) section, I got lost in the weeds. From my understanding, there seems to be both a `.gemspec` file, as well as a `gemspec` method? I think it could be helpful for myself to have a more high-level explanation of what a `.gemspec` file is first before reading this in-depth documentation, especially as someone who has never made a gem before. After reading and going through Ryan Bigg's [Developing a Ruby Gem using Bundler](http://bundler.io/v1.15/guides/creating_gem.html) guide, I found his more high-level explanation to be helpful:

```
- The Gem Specification file. This is where we provide information for Rubygems’ consumption such as the name, description and homepage of our gem. This is also where we specify the dependencies our gem needs to run.
```
## [Developing a Ruby Gem using Bundler](http://bundler.io/v1.15/guides/creating_gem.html)
- Maybe somewhere in the reference documentation, we should recommend first-time contributors to go through the [Developing a Ruby Gem using Bundler](http://bundler.io/v1.15/guides/creating_gem.html) guide first? I feel like this guide helped me better grasp the file structure of a gem, as well as what exactly the `.gemspec` file is used for.

- Important sidenote: From the [Developing a Ruby Gem using Bundler](http://bundler.io/v1.15/guides/creating_gem.html) page, the [Using Bundler in Applications](http://bundler.io/v1.15/guides/v1.15/guides/using_bundler_in_applications.html) link on the menu on the left-side is broken. [This]( http://bundler.io/v1.15/guides/using_bundler_in_applications.html) is the correct link.

## [How to git bisect in projects using Bundler](http://bundler.io/git_bisect.html)

- In the [How to git bisect in projects using Bundler](http://bundler.io/git_bisect.html) guide, I think it would be wonderful if we could briefly explain the purpose of `git bisect` and why it's helpful, for some context. I personally do not have much experience with using this git command, so having more context would be very useful for myself.  We could provide a link to the [`git bisect`](https://git-scm.com/docs/git-bisect) documentation. I actually found  [this](https://robots.thoughtbot.com/git-bisect) blogpost from Thoughtbot to be helpful. I definitely do appreciate linking to this closed [issue](https://github.com/bundler/bundler/issues/3726), too 👌🏼
