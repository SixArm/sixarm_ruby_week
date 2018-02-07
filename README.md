# SixArm.com → Ruby → <br> Week model based on Ruby Date

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_week.svg)](http://badge.fury.io/rb/sixarm_ruby_week)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_week.png)](https://travis-ci.org/SixArm/sixarm_ruby_week)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/$id/maintainability)](https://codeclimate.com/github/SixArm/$dir/maintainability)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_week/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_week?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_week>
* Doc: <http://sixarm.com/sixarm_ruby_week/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_week>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

This gem models a week, based on the built-in Ruby Date class.

For docs go to <http://sixarm.com/sixarm_ruby_week/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_week

Or add this to your Gemfile:

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

