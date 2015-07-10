# SixArm.com » Ruby » <br> Week model based on Ruby Date

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_week.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_week)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_week.png)](https://travis-ci.org/SixArm/sixarm_ruby_week)

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

    gem "sixarm_ruby_week", ">=1.1.7", "<2"

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
