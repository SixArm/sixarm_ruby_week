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
      WEEK.date.cwyear.must_equal 2012
      WEEK.date.cweek.must_equal 1
      WEEK.date.cwday.must_equal 1
    end

  end

  describe "#date" do

    it "=> Date" do
      WEEK.date.must_be_kind_of Date
    end

    it "=> the date that initiazed the week" do 
      WEEK.date.must_equal DATE
    end

  end

  describe "#to_s" do 

    it "=> String" do
      WEEK.to_s.must_be_kind_of String
    end

    it "=> the week's date formatted as YYYY-MM-DD" do
      WEEK.to_s.must_equal TEXT
    end

  end

  describe ".now" do

    it "=> Week" do
      Week.now.must_be_kind_of Week
    end

    it "=> a week based on today's date" do
      Week.now.date.must_equal Date.today
    end

  end

  describe ".parse" do

    it "=> Week" do
      Week.parse(TEXT).must_be_kind_of Week
    end

    it "=> a week based on the date text" do
      s = '2012-01-02'
      Week.parse(s).date.must_equal Date.parse(s)
    end

  end

  describe "#hash" do

    it "=> Fixnum" do
      WEEK.hash.must_be_kind_of Fixnum
    end

    it "=> the week's date's hash" do
      WEEK.hash.must_equal WEEK.date.hash
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
      (WEEK <=> WEEK_NEXT).must_equal -1
    end

    it "x=y => 0" do
      (WEEK <=> WEEK).must_equal 0
    end

    it "x>y => 1" do 
      (WEEK <=> WEEK_PREV).must_equal 1
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
        (WEEK + 0).must_be_kind_of Week
      end

      it "+ 0 => this week" do
        (WEEK + 0).must_equal WEEK
      end

      it "+ 1 => next week" do
        (WEEK + 1).must_equal WEEK_NEXT
      end

      it "+ (-1) => previous week" do
        (WEEK + (-1)).must_equal WEEK_PREV
      end

      it "+ any other number => different week" do
        w = WEEK + 2
        w.wont_equal WEEK_PREV
        w.wont_equal WEEK
        w.wont_equal WEEK_NEXT
      end

    end

    describe "with bad type" do

      it "TypeError" do
        proc { WEEK + "foo" }.must_raise TypeError
      end
      
    end

  end
  
  describe "-" do

    describe "with Numeric type" do

      it "=> Week" do
        (WEEK - 0).must_be_kind_of Week
      end

      it "- 0 => this week" do
        (WEEK - 0).must_equal WEEK
      end

      it "- 1 => previous week" do
        (WEEK - 1).must_equal WEEK_PREV
      end

      it "- (-1) => next week" do
        (WEEK - (-1)).must_equal WEEK_NEXT
      end

      it "- any other number => different week" do
        w = WEEK - 2
        w.wont_equal WEEK_PREV
        w.wont_equal WEEK
        w.wont_equal WEEK_NEXT
      end

    end

    describe "with Week type" do
      
      it "=> Integer" do
        (WEEK - WEEK).must_be_kind_of Integer
      end

      it "this week - previous week => 1" do
        (WEEK - WEEK_PREV).must_equal 1 
      end

      it "this week - this week => 0" do
        (WEEK - WEEK).must_equal 0
      end

      it "this week - next week => -1" do
        (WEEK - WEEK_NEXT).must_equal -1
      end
      
    end

    describe "with bad type" do

      it "TypeError" do
        proc { WEEK - "foo" }.must_raise TypeError 
      end

    end

  end

  describe "#previous" do

    it "=> Week" do
      WEEK.previous.must_be_kind_of Week
    end

    it "=> a week seven days earlier" do
      Week.new(DATE).previous.must_equal Week.new(DATE-7)
    end

  end

  describe "#next" do

    it "=> Week" do
      (WEEK.next).must_be_kind_of Week
    end

    it "=> a week seven days later" do
      Week.new(DATE).next.must_equal Week.new(DATE+7)
    end

  end

  describe "#start_date" do

    it "=> Date" do
      WEEK.start_date.must_be_kind_of Date
    end

    it "=> the initialzation date" do
      WEEK.start_date.must_equal DATE
    end
    
  end

  describe "#end_date" do

    it "=> Date" do
      WEEK.end_date.must_be_kind_of Date
    end

    it "=> six days after the initialization date" do
      WEEK.end_date.must_equal DATE + 6
    end

  end

  describe "#date_range" do

    it "=> Range" do
      WEEK.date_range.must_be_kind_of Range
    end

    it "=> Range first is the start date" do
      WEEK.date_range.first.must_equal WEEK.start_date
    end

    it "=> Range last is the end date" do
      WEEK.date_range.last.must_equal WEEK.end_date
    end

  end

  describe "#include?" do

    it "all days in this week => true" do
      WEEK.must_include DATE+0
      WEEK.must_include DATE+1
      WEEK.must_include DATE+2
      WEEK.must_include DATE+3
      WEEK.must_include DATE+4
      WEEK.must_include DATE+5
      WEEK.must_include DATE+6
    end

    it "any day before this week => false" do
      WEEK.wont_include DATE-1
      WEEK.wont_include DATE-999
    end

    it "any day after this week => false" do
      WEEK.wont_include DATE+7
      WEEK.wont_include DATE+999
    end

  end

end
