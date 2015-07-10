# SixArm.com » Ruby » <br> Week model based on Ruby Date

<!--HEADER-OPEN-->

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_week.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_week)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_week.png)](https://travis-ci.org/SixArm/sixarm_ruby_week)

* Git: <https://github.com/sixarm/sixarm_ruby_week>
* Doc: <http://sixarm.com/sixarm_ruby_week/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_week>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--HEADER-SHUT-->


## Introduction

This gem models a week, based on the built-in Ruby Date class.

For docs go to <http://sixarm.com/sixarm_ruby_week/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_week", ">= 1.1.7, < 2"

To install using the command line, run this:

    gem install sixarm_ruby_week -v ">= 1.1.7, < 2"

To install using the command with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_week -v ">= 1.1.7, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_week"

<!--INSTALL-SHUT-->


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
