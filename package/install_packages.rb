#!/usr/bin/ruby

require_relative "../src/stage.rb"
require_relative "../repos/repo_defs.rb"
require_relative "../src/package.rb"

INSTALL_DIR = "#{ENV["HOME"]}/.local"
puts "#{CTAGS}"
stage("echo 'hi'", "Install packages to #{INSTALL_DIR}?")
abduco_package = Package.new(ABDUCO, INSTALL_DIR)
abduco_package.compile("./configure --prefix=#{INSTALL_DIR} && make")
abduco_package.install("make install")


ctags_package = Package.new(CTAGS, INSTALL_DIR)
ctags_package.compile("./autogen.sh && ./configure --prefix=#{INSTALL_DIR} && make")
ctags_package.install("make install")

nvr_package = Package.new(NVR, INSTALL_DIR)
nvr_package.install("pip3 install --user neovim-remote")
