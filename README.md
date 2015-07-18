# SixArm.com » Ruby » <br> Week model based on Ruby Date

<!--HEADER-OPEN-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_week.svg)](http://badge.fury.io/rb/sixarm_ruby_week)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_week.png)](https://travis-ci.org/SixArm/sixarm_ruby_week)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_week.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_week)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_week/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_week?branch=master)

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

    gem "sixarm_ruby_week", ">= 1.2.0", "< 2"

To install using the command line, run this:

    gem install sixarm_ruby_week -v ">= 1.2.0, < 2"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_week -v ">= 1.2.0, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_week"

<!--INSTALL-SHUT-->


## Examples

Create:

    week = Week.now

    week = Week.new(Date.today)

    week = Week.parse("2015-12-31")

Enumerable:

    week.previous => seven days earlier

    week.next => seven days later

Math:

    week - 2 => two weeks earlier

    week + 2 => two weeks later

First/Last, Start/Stop, Begin/End:

    week.first_date => the first date of the week
    week.last_date => the last date of the week

    week.start_date => same as first_date
    week.stop_date => same as last_date

    week.begin_date => same as first_date
    week.end_date => same as last_date

Range:

    week.date_range => week.first_date..week.last_date

Collection:

    week.include?(date) => true

