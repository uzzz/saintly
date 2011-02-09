= Saintly

* http://www.bitbucket.org/digger250/saintly

== DESCRIPTION:

A library for censoring naughty words

== FEATURES/PROBLEMS:

* exclude partial matches
* exclude whole words
* list of allowed words

== SYNOPSIS:

Saintly.sanitize(dirty_text)
=> "cleaned text"

In an ActiveRecord model:
sanctify :column1, :column2 ...

You can add words or partials in your config/initializers like so:

Saintly::RESTRICTED_PARTIALS << 'idiot'
Saintly::ALLOWED_WORDS << 'dumbass'
Saintly::RESTRICTED_WORDS << 'pansy'


== REQUIREMENTS:

== INSTALL:

* gem install saintly

== LICENSE:

(The MIT License)

  Copyright (c) 2010 Justin Coyne

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
      'Software'), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
