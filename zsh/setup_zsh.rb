#!/usr/bin/ruby

require_relative "../src/stage.rb"
require_relative "setup_repos.rb"

DOTFILES_DIR=File.expand_path(File.dirname(__FILE__))

stage("cp ~/.zshrc ~/.zshrc.orig && rm ~/.zshrc", "Back up .zshrc and rm?").ask.run
stage("ln -s #{DOTFILES_DIR}/.zshrc ~/.zshrc", "Create symlink to .zshrc").ask.show.run
# stage("chsh -s /bin/zsh", "Change default shell to zsh").ask.show.run
