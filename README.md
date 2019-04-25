# SixArm.com → Ruby → <br> Week model based on Ruby Date

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_week.svg)](http://badge.fury.io/rb/sixarm_ruby_week)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_week.png)](https://travis-ci.org/SixArm/sixarm_ruby_week)
[![Code Climate](https://api.codeclimate.com/v1/badges/f0cb0c2061882c919bd2/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_week/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_week>
* Doc: <http://sixarm.com/sixarm_ruby_week/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_week>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

This gem models a week, based on the built-in Ruby Date class.

For docs go to <http://sixarm.com/sixarm_ruby_week/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_week

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_week'

### Require

To require the gem in your code:

    require 'sixarm_ruby_week'

<!--install-shut-->


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

First/Last, Begin/End, Start/Stop:

    week.first_date => the first date of the week
    week.last_date => the last date of the week

    week.begin_date => first_date
    week.end_date => last_date

    week.start_date => first_date
    week.stop_date => last_date

Range:

    week.date_range => week.first_date..week.last_date

Collection:

    week.include?(date) => true

