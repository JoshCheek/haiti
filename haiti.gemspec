# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "haiti/version"

Gem::Specification.new do |s|
  s.name        = "haiti"
  s.version     = Haiti::VERSION
  s.authors     = ["Josh Cheek"]
  s.email       = ["josh.cheek@gmail.com"]
  s.homepage    = "https://github.com/JoshCheek/haiti"
  s.summary     = %q{Simple Cucumber steps for command line programs}
  s.description = "Aruba provides Cucumber helpers for command line programs, but it's way more sophisticated than I can understand, " \
                  "so I wind up reinventing that wheel in miniature for a lot of projects. This is just an extraction of that. "       \
                  "It aims to be simple and easy to understand/extend."
  s.license     = "WTFPL"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "cucumber", "~> 1.0"
  s.add_dependency "rspec",    "~> 2.0" # I don't actually know where the cutoff is, but I'm not doing anything fancy here
end