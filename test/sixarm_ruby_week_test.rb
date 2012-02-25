# -*- coding: utf-8 -*-
require 'test/unit'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_week'

class WeekTest < Test::Unit::TestCase

  DATE = Date.parse('2012-01-02')
  WEEK = Week.new(DATE)
  WEEK_PREV = Week.new(DATE-7)
  WEEK_NEXT = Week.new(DATE+7)

  def test_initialize
    assert_equal(WEEK.date.cwyear, 2012)
    assert_equal(WEEK.date.cweek, 1)
    assert_equal(WEEK.date.cwday, 1)
  end

  def test_date
    assert_equal(DATE, WEEK.date)
  end

  def test_to_s
    assert_equal('2012-01-02', WEEK.to_s)
  end

  def test_now
    assert_equal(Date.today, Week.now.date)
  end

  def test_parse
    week = Week.parse('2012-01-02')
    assert_equal(DATE, week.date)
  end

  def test_hash
    assert_equal(DATE.hash, WEEK.hash)
  end

  def test_eq
    assert(WEEK == Week.new(DATE))
    assert(!(WEEK == Week.new(DATE+1)))
  end

  def test_eql
    assert(WEEK.eql? Week.new(DATE))
    assert(!(WEEK.eql? Week.new(DATE+1)))
  end

  def test_compare
    assert_equal(-1, WEEK <=> WEEK_NEXT)
    assert_equal( 0, WEEK <=> WEEK)
    assert_equal( 1, WEEK <=> WEEK_PREV)
  end

  def test_lt
    assert(!(WEEK < WEEK_PREV))
    assert(!(WEEK < WEEK))
    assert(WEEK < WEEK_NEXT)
  end

  def test_lte
    assert(!(WEEK <= WEEK_PREV))
    assert(WEEK <= WEEK)
    assert(WEEK < WEEK_NEXT)
  end

  def test_gt
    assert(WEEK > WEEK_PREV)
    assert(!(WEEK > WEEK))
    assert(!(WEEK > WEEK_NEXT))
  end

  def test_gte
    assert(WEEK > WEEK_PREV)
    assert(WEEK >= WEEK)
    assert(!(WEEK > WEEK_NEXT))
  end

  def test_plus_with_numeric
    assert_equal(WEEK_NEXT, WEEK + 1)
    assert_not_equal(WEEK_NEXT, WEEK + 2)
  end

  def test_plus_with_bad_type
    assert_raise TypeError do
      WEEK + "foo"
    end
  end

  def test_minus_with_numeric
    assert_equal(WEEK_PREV, WEEK - 1)
    assert_not_equal(WEEK_PREV, WEEK + 2)
  end

  def test_minus_with_week
    assert_equal(1, WEEK - WEEK_PREV)
    assert_equal(0, WEEK - WEEK)
    assert_equal(-1, WEEK - WEEK_NEXT)
  end

  def test_minus_with_bad_type
    assert_raise TypeError do
      WEEK - "foo"
    end
  end

  def test_previous
    assert_equal(WEEK_PREV, WEEK.previous)
  end

  def test_next
    assert_equal(WEEK_NEXT, WEEK.next)
  end

  def test_start_date
    assert_equal(DATE, WEEK.start_date)
  end

  def test_end_date
    assert_equal(DATE + 6, WEEK.end_date)
  end

  def test_includes
    assert(!(WEEK.includes? DATE-1))
    assert(WEEK.includes? DATE+0)
    assert(WEEK.includes? DATE+1)
    assert(WEEK.includes? DATE+2)
    assert(WEEK.includes? DATE+3)
    assert(WEEK.includes? DATE+4)
    assert(WEEK.includes? DATE+5)
    assert(WEEK.includes? DATE+6)
    assert(!(WEEK.includes? DATE+7))
  end

end
