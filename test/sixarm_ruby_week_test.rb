# -*- coding: utf-8 -*-
require 'test/unit'
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_week'

describe Week do

  before do
    DATE ||= Date.parse('2012-01-02')
    WEEK ||= Week.new(DATE)
    WEEK_PREV ||= Week.new(DATE-7)
    WEEK_NEXT ||= Week.new(DATE+7)
  end

  describe ".initialize" do

    it "must initialize the year, week, and day" do
      assert_equal(WEEK.date.cwyear, 2012)
      assert_equal(WEEK.date.cweek, 1)
      assert_equal(WEEK.date.cwday, 1)
    end

  end

  describe "#date" do

    it do 
      assert_equal(DATE, WEEK.date)
    end

  end

  describe "#to_s" do 

    it do
      assert_equal('2012-01-02', WEEK.to_s)
    end

  end

  describe "#now" do

    it do
      assert_equal(Date.today, Week.now.date)
    end

  end

  describe "#parse" do

    it do
      week = Week.parse('2012-01-02')
      assert_equal(DATE, week.date)
    end

  end

  describe "#hash" do

    it do
      assert_equal(DATE.hash, WEEK.hash)
    end

  end

  describe "#==" do

    it "weeks created from the same date => true" do
      assert(WEEK == Week.new(DATE))
    end

    it "weeks created from different dates => false" do
      assert(WEEK != Week.new(DATE+1))
    end

  end

  describe "#eql?" do
    
    it "weeks created from the same date => true" do
      assert(WEEK.eql? Week.new(DATE))
    end
    
    it "weeks created from different dates => false" do
      assert(!(WEEK.eql? Week.new(DATE+1)))
    end

  end

  describe "<=>" do

    it "x<y => -1" do
      assert_equal(-1, WEEK <=> WEEK_NEXT)
    end

    it "x=y => 0" do
      assert_equal( 0, WEEK <=> WEEK)
    end

    it "x>y => 1" do 
      assert_equal( 1, WEEK <=> WEEK_PREV)
    end

  end

  describe "#<" do

    it "x<y => true" do
      assert(WEEK < WEEK_NEXT)
    end

    it "x=y => false" do
      assert(!(WEEK < WEEK))
    end

    it "x>y => false" do
      assert(!(WEEK < WEEK_PREV))
    end

  end

  describe "#<=" do

    it "x<y => false" do
      assert(WEEK < WEEK_NEXT)
    end

    it "x=y => true" do
      assert(WEEK <= WEEK)
    end

    it "x>y => false" do
      assert(!(WEEK <= WEEK_PREV))
    end

  end

  describe "#>" do
      
    it "x<y => false" do
      assert(!(WEEK > WEEK_NEXT))
    end

    it "x=y => false" do
      assert(!(WEEK > WEEK))
    end

    it "x>y => true" do
      assert(WEEK > WEEK_PREV)
    end

  end

  describe "#>=" do

    it "x<y => false" do
      assert(!(WEEK >= WEEK_NEXT))
    end

    it "x=y => true" do
      assert(WEEK >= WEEK)
    end

    it "x>y => true" do
      assert(WEEK >= WEEK_PREV)
    end

  end
  
  describe "#+" do

    describe "with Numeric type" do

      it "+ 0 => this week" do
        assert_equal(WEEK, WEEK + 0)
      end

      it "+ 1 => next week" do
        assert_equal(WEEK_NEXT, WEEK + 1)
      end

      it "+ (-1) => previous week" do
        assert_equal(WEEK_PREV, WEEK + (-1))
      end

      it "+ any other number => different week" do
        w = WEEK + 2
        refute_equal(WEEK_PREV, w)
        refute_equal(WEEK, w)
        refute_equal(WEEK_NEXT, w)
      end

    end

    describe "with bad type" do

      it "raises TypeError" do
        assert_raises TypeError do
          WEEK + "foo"
        end
      end
      
    end

  end
  
  describe "#-" do

    describe "with Numeric type" do

      it "- 0 => this week" do
        assert_equal(WEEK, WEEK - 0)
      end

      it "- 1 => previous week" do
        assert_equal(WEEK_PREV, WEEK - 1)
      end

      it "- (-1) => next week" do
        assert_equal(WEEK_NEXT, WEEK - (-1))
      end

      it "- any other number => different week" do
        w = WEEK - 2
        refute_equal(WEEK_PREV, w)
        refute_equal(WEEK, w)
        refute_equal(WEEK_NEXT, w)
      end

    end

    describe "with Week type" do
      
      it "this week - previous week => 1" do
        assert_equal(1, WEEK - WEEK_PREV)
      end

      it "this week - this week => 0" do
        assert_equal(0, WEEK - WEEK)
      end

      it "this week - next week => -1" do
        assert_equal(-1, WEEK - WEEK_NEXT)
      end
      
    end

    describe "with bad type" do

      it "raises TypeError" do
        assert_raises TypeError do
          WEEK - "foo"
        end
      end

    end

  end

  describe "#previous" do

    it do
      assert_equal(WEEK_PREV, WEEK.previous)
    end

  end

  describe "#next" do

    it do
      assert_equal(WEEK_NEXT, WEEK.next)
    end

  end

  describe "#start_date" do

    it do
      assert_equal(DATE, WEEK.start_date)
    end
    
  end

  describe "#end_date" do
    
    it do
      assert_equal(DATE + 6, WEEK.end_date)
    end

  end

  describe "#includes?" do

    it "all days in this week => true" do
      assert(WEEK.includes? DATE+0)
      assert(WEEK.includes? DATE+1)
      assert(WEEK.includes? DATE+2)
      assert(WEEK.includes? DATE+3)
      assert(WEEK.includes? DATE+4)
      assert(WEEK.includes? DATE+5)
      assert(WEEK.includes? DATE+6)
    end

    it "any day before this week => false" do
      assert(!(WEEK.includes? DATE-1))
      assert(!(WEEK.includes? DATE-999))
    end

    it "any day after this week => false" do
      assert(!(WEEK.includes? DATE+7))
      assert(!(WEEK.includes? DATE+999))
    end

  end

end
