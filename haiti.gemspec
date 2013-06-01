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
  s.description = "Extraction of cucumber helpers for running binaries that I wind up writing ad-hoc for many projects. " \
                  "It is minimal which lowers the barrier for entry, making it easy to understand/extend."                \
                  "If you need something more powerful, there is Aruba."
  s.license     = "WTFPL"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "cucumber", "~> 1.0"
  s.add_dependency "rspec",    "~> 2.0" # I don't actually know where the cutoff is, but I'm not doing anything fancy here
end
