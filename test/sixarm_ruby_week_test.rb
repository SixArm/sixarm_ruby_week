# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_week'

describe Week do

  before do
    TEXT ||= '2012-01-02'
    DATE ||= Date.parse(TEXT)
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

    it "=> Date" do
      assert_kind_of(Date, WEEK.date)
    end

    it "=> the date that initiazed the week" do 
      assert_equal(DATE, WEEK.date)
    end

  end

  describe "#to_s" do 

    it "=> String" do
      assert_kind_of(String, WEEK.to_s)
    end

    it "=> the week's date formatted as YYYY-MM-DD" do
      assert_equal(TEXT, WEEK.to_s)
    end

  end

  describe ".now" do

    it "=> Week" do
      assert_kind_of(Week, Week.now)
    end

    it "=> a week based on today's date" do
      assert_equal(Date.today, Week.now.date)
    end

  end

  describe ".parse" do

    it "=> Week" do
      assert_kind_of(Week, Week.parse(TEXT))
    end

    it "=> a week based on the date text" do
      s = '2012-01-02'
      assert_equal(Date.parse(s), Week.parse(s).date)
    end

  end

  describe "#hash" do

    it "=> Fixnum" do
      assert_kind_of(Fixnum, WEEK.hash)
    end

    it "=> the week's date's hash" do
      assert_equal(WEEK.date.hash, WEEK.hash)
    end

  end

  describe "#eql?" do
    
    it "weeks created from the same date => true" do
      assert(WEEK.eql? Week.new(DATE))
    end
    
    it "weeks created from different dates => false" do
      refute(WEEK.eql? Week.new(DATE+1))
    end

  end

  describe "==" do

    it "weeks created from the same date => true" do
      assert(WEEK == Week.new(DATE))
    end

    it "weeks created from different dates => false" do
      refute(WEEK == Week.new(DATE+1))
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

  describe "<" do

    it "x<y => true" do
      assert(WEEK < WEEK_NEXT)
    end

    it "x==y => false" do
      refute(WEEK < WEEK)
    end

    it "x>y => false" do
      refute(WEEK < WEEK_PREV)
    end

  end

  describe "<=" do

    it "x<y => false" do
      assert(WEEK < WEEK_NEXT)
    end

    it "x==y => true" do
      assert(WEEK <= WEEK)
    end

    it "x>y => false" do
      refute(WEEK <= WEEK_PREV)
    end

  end

  describe ">" do
      
    it "x<y => false" do
      refute(WEEK > WEEK_NEXT)
    end

    it "x==y => false" do
      refute(WEEK > WEEK)
    end

    it "x>y => true" do
      assert(WEEK > WEEK_PREV)
    end

  end

  describe ">=" do

    it "x<y => false" do
      refute(WEEK >= WEEK_NEXT)
    end

    it "x==y => true" do
      assert(WEEK >= WEEK)
    end

    it "x>y => true" do
      assert(WEEK >= WEEK_PREV)
    end

  end
  
  describe "+" do

    describe "with Numeric type" do

      it "=> Week" do
        assert_kind_of(Week, WEEK + 0)
      end

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
  
  describe "-" do

    describe "with Numeric type" do

      it "=> Week" do
        assert_kind_of(Week, WEEK - 0)
      end

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
      
      it "=> Integer" do
        assert_kind_of(Integer, WEEK - WEEK)
      end

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

    it "=> Week" do
      assert_kind_of(Week, WEEK.previous)
    end

    it "=> a week seven days earlier" do
      assert_equal(Week.new(DATE-7), Week.new(DATE).previous)
    end

  end

  describe "#next" do

    it "=> Week" do
      assert_kind_of(Week, WEEK.next)
    end

    it "=> a week seven days later" do
      assert_equal(Week.new(DATE+7), Week.new(DATE).next)
    end

  end

  describe "#start_date" do

    it "=> Date" do
      assert_kind_of(Date, WEEK.start_date)
    end

    it "=> the initialzation date" do
      assert_equal(DATE, WEEK.start_date)
    end
    
  end

  describe "#end_date" do

    it "=> Date" do
      assert_kind_of(Date, WEEK.end_date)
    end

    it "=> six days after the initialization date" do
      assert_equal(DATE + 6, WEEK.end_date)
    end

  end

  describe "#date_range" do

    it "=> Range" do
      assert_kind_of(Range, WEEK.date_range)
    end

    it "=> Range first is the start date" do
      assert_equal(WEEK.start_date, WEEK.date_range.first)
    end

    it "=> Range last is the end date" do
      assert_equal(WEEK.end_date, WEEK.date_range.last)
    end

  end

  describe "#include?" do

    it "all days in this week => true" do
      assert_includes(WEEK, DATE+0)
      assert_includes(WEEK, DATE+1)
      assert_includes(WEEK, DATE+2)
      assert_includes(WEEK, DATE+3)
      assert_includes(WEEK, DATE+4)
      assert_includes(WEEK, DATE+5)
      assert_includes(WEEK, DATE+6)
    end

    it "any day before this week => false" do
      refute_includes(WEEK, DATE-1)
      refute_includes(WEEK, DATE-999)
    end

    it "any day after this week => false" do
      refute_includes(WEEK, DATE+7)
      refute_includes(WEEK, DATE+999)
    end

  end

end
