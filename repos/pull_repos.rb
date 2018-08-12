#!/usr/bin/ruby

require_relative "../src/repo.rb"
require_relative "repo_defs.rb"
setup_repos(ZSH_REPOS)
setup_repos([ABDUCO, CTAGS, NVR])


