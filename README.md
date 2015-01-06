# SixArm.com » Ruby » <br> Week model based on Ruby Date

* Doc: <http://sixarm.com/sixarm_ruby_week/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_week>
* Repo: <http://github.com/sixarm/sixarm_ruby_week>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

This gem models a week, based on the built-in Ruby Date class.

For docs go to <http://sixarm.com/sixarm_ruby_week/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_week

Bundler:

    gem "sixarm_ruby_week", "~>1.1.6"

Require:

    require "sixarm_ruby_week"


## Install with security (optional)

To enable high security	for all	our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_week --trust-policy HighSecurity


## Examples

Create:
    
    date = Date.parse('2012-01-02')
    week = Week.new(date)
    week.to_s => '2012-01-02'

Parse:

    week = Week.parse('2012-01-02')
    week => 2012-01-02

Enumerable:

    week.previous => 2011-12-26
    week.next => 2012-01-16

Math:

    week - 3 => 2011-12-12
    week + 3 => 2012-01-24

Start & End Dates:

    week.start_date => 2012-01-02
    week.end_date => 2012-01-08

Range:

    week.date_range => Range(2012-01-02..2012-01-08)

Collection:

    date = Date.parse('2012-01-02')
    week.include?(date) => true
    week.include?(date+7) => false


## Changes

* 2012-03-16 1.1.6 Upgrade for Ruby 1.9.3, minitest/spec, and improved docs.
* 2012-03-12 1.1.4 Improve tests from test/unit style toward minitest/spec style
* 2012-03-11 1.1.2 Add #date_range method to return start_date..end_date
* 2012-03-10 1.1.1 Rename #includes? to #include? because it matches Ruby's Array include? method 
* 2012-02-24 1.1.0 Add methods .now, #includes?, #previous, #next, #start_date, #end_date, and improve examples
* 2012-02-23 1.0.0 Updates for gem publishing 


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2013 Joel Parker Henderson
