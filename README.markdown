Sassafras
=========

After spending hours copying and pasting hex values into my Sass stylesheets, 
I knew there had to be a better way.  Enter Sassafras, the Sass color scheme 
generator.

Sassafras will generate any of the following types of color schemes and create 
logically-named Sass variables for varying lightnesses:

* basic
* complementary
* analogous
* triadic
* split complementary
* rectangle
* square

Installation
============

Note:  Make sure you're using RubyGems >= 1.2.0.

    $ sudo gem sources -a http://gems.github.com
    $ sudo gem install teejayvanslyke-sassafras

Usage
=====

Generate basic variants of red:
    
    $ sassafras -b red

Generate basic variants of red and green:

    $ sassafras -t complementary -b red

For more information on the various types of color schemes supported by Sassafras, 
please see the color theory tutorial on which Sassafras was based at http://www.tigercolor.com/color-lab/color-theory/color-theory-intro.htm
