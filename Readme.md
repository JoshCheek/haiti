[![Build Status](https://api.travis-ci.org/JoshCheek/haiti.svg?branch=master)](https://travis-ci.org/JoshCheek/haiti)

Haiti
=====

Aruba provides Cucumber helpers for command line programs, but it's way more sophisticated than I can understand,
so I wind up reinventing that wheel in miniature for a lot of projects. This is just an extraction of that.
It aims to be simple and easy to understand/extend.

It's barely featured, currently the only features are what I extracted from SeeingIsBelieving's test suite. I'll
add more to it as I need them, or you're welcome to. Its testing is entirely in cucumber at the moment, and there
are no negative tests to assert that things don't work, so if anyone winds up working on it, I wouldn't mind that.


To run tests
============

    cd tests
    bundle
    bundle exec cucumber

Todo
====

**These would actually be useful right now**

* All existing defs can take single or double quotes
* Failures on stdout also display stderr
* step def for does not include

**These should just generally be done**
* Add tests showing that curlies get interpreted where expected
* Add tests proving that bin gets stuck in the path
* Add tests for negative assertions (currently if all step defs were empty, this would pass the suite)

Things that would be nice, but probably won't ever happen, b/c honestly, how often am I really going to touch this lib?
=======================================================================================================================

* all step defs work with single or double quotes
* multiple bin directories
* don't fucking pollute the World (currently this is how I get `eval_curlies` in there)
* assertions about the existence and contents of files
* a "given I'm in a clean directory" which wipes out the proving grounds

License
=======

           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2004

    Copyright (C) 2013 Josh Cheek <josh.cheek@gmail.com>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

     0. You just DO WHAT THE FUCK YOU WANT TO.
