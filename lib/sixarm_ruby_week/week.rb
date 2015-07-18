# -*- coding: utf-8 -*-
=begin rdoc
Week class.
=end

require "date"

class Week

  attr :date

  # Initialize the week with a date.
  #
  # Example:
  #
  #     require "date"
  #     date = Date.today
  #     week = Week.new(date)
  #
  # Return:
  #
  #  * [Week] The new week
  #
  def initialize(date)
    @date = date
  end

  # Return the week's date, coverted to a string.
  #
  # Example:
  #
  #     date = Date.parse("2015-12-31")
  #     week = Week.new(date)
  #     week.to_s #=> "2015-12-31"
  #
  # Return:
  #
  #  * [String] The week's date, coverted to a string.
  #
  def to_s
    @date.to_s
  end

  ###
  #
  # Instantiations
  #
  ###
  
  # Return the week that starts today
  #
  # Example:
  #
  #     week = Week.now
  #
  def self.now
    Week.new(Date.today)
  end

  # Parse date text to a week. 
  #
  # Example:
  #
  #     week = Week.parse("2015-12-31") 
  #
  # Return:
  #
  #  * [Week] A new week.
  #
  def self.parse(date_text)
    Week.new(Date.parse(date_text))
  end

  ###
  #
  # Comparable
  #
  ###

  # Return a hash for object comparison.
  #
  # This is simply the hash of the date, which means
  # that two week objects created with the same date
  # always compare equally.
  #
  # Example:
  #
  #     date = Date.today
  #     date.hash #=> 1655958911300557206
  #     week = Week.new(date)
  #     week.hash #=> 1655958911300557206
  #
  # Return:
  #
  #   * [Fixnum] The week's date's object hash number.
  #
  def hash
    date.hash
  end

  # Return week1.date == week2.date
  #
  # Example:
  #
  #    a = Week.now
  #    b = Week.now
  #    a == b #=> true
  #
  # Return:
  #
  #   * [true,false]
  #
  def ==(other)
    self.date == other.date
  end

  # Return week1.date.eql? week2.date
  #
  # Example:
  #
  #    a = Week.now
  #    b = Week.now
  #    a.eql? b #=> true
  #
  # Return:
  #
  #   * [true,false]
  #
  alias :eql? :==

  # Return week1.date <=> week2.date
  #
  #    a = Week.now
  #    b = Week.now
  #    a <=> b #=> 0
  #
  # Return:
  #
  #  * [-1,0,1]
  #
  def <=>(other)
   return self.date <=> other.date
  end


  # Return week1.date < week2.date
  #
  # Example:
  #
  #    a = Week.new(date)
  #    b = Week.new(date - 1)
  #    a < b #=> true
  #
  # Return:
  #
  #  * [true,false]
  #
  def <(other)
    self.date < other.date
  end


  # Return week1.date <= week2.date
  #
  # Example:
  #
  #    a = Week.new(date)
  #    b = Week.new(date - 1)
  #    a <= b #=> true
  #
  # Return:
  #
  #  * [true,false]
  #
  def <=(other)
    self.date <= other.date
  end


  # Return week1.date > week2.date
  #
  # Example:
  #
  #    a = Week.new(date)
  #    b = Week.new(date + 1)
  #    a > b #=> true
  #
  # Return:
  #
  #  * [true,false]
  #
  def >(other)
    self.date > other.date
  end


  # Return week1.date >= week2.date
  #
  # Example:
  #
  #    a = Week.new(date)
  #    b = Week.new(date + 1)
  #    a >= b #=> true
  #
  # Return:
  #
  #  * [true,false]
  #
  def >=(other)
    self.date >= other.date
  end

  ###
  #
  # Math
  #
  ###

  # Addition: week + other => week
  #
  # Return a date object pointing at other weeks after self.
  #
  # The other should be a numeric value.
  #
  # Example:
  #
  #     week = Week.new(date)
  #     week + 3 #=> three weeks later
  #
  # Return:
  #
  #  * [Week]
  #
  def +(other)
    if other.is_a? Numeric
      return Week.new(date + (other.to_i * 7))
    else
      raise TypeError
    end
  end

  # Subtraction: week - other => week or integer
  #
  # If the other is a numeric value, return a week object pointing other weeks before self. 
  #   
  # If the other is a week object, then return the difference between the two weeks.
  #
  # Example:
  #
  #     week = Week.new(date)
  #     week - 3 => three weeks earlier
  #
  # Example:
  #
  #     a =  Week.new(date)
  #     b =  Week.new(date + 21)
  #     b - a => 3
  #
  # Return:
  #
  #  * [Week]
  #
  def -(other)
    if other.is_a? Numeric
      return Week.new(date - (other * 7))
    elsif other.is_a? Week
      return ((self.date - other.date) / 7).round
    else
      raise TypeError
    end
  end
  
  ###
  #
  # Enumerable
  #
  ###

  # Return the previous week, i.e. seven days earlier.
  #
  # Example:
  #
  #     week =  Week.new(date)
  #     week.previous #=> seven days earlier
  #
  # Return:
  #
  #  * [Week] The previous week
  #
  def previous
    return self - 1
  end

  # Return the next week, i.e. seven days later.
  #
  # Example:
  #
  #     week =  Week.new(date)
  #     week.next #=> seven days later.
  #
  # Return:
  #
  #  * [Week] The next week
  #
  def next
    return self + 1
  end

  ###
  #
  # Ranges
  #
  ###
 
  # Return the first date of this week.
  #
  # Example:
  #
  #     week = Week.new(date)
  #     week.first_date #=> date
  #
  # Aliases:
  #
  #     week.begin_date
  #     week.start_date
  #
  ## Return:
  #
  #   * [Date] week.date
  #
  def first_date
    @date
  end

  alias :begin_date :first_date
  alias :start_date :first_date  

  # Return the last date of this week.
  #
  # Return 
  #
  # Example:
  #
  #     week = Week.new(date)
  #     week.last_date #=> date + 6
  #
  # Aliases:
  #
  #     week.end_date
  #     week.stop_date
  #
  # Return:
  #
  #   * [Date] week.date + 6
  #
  def last_date
    @date + 6
  end

  alias :end_date :last_date
  alias :stop_date :last_date
  
  # Return the date range of the week.
  #
  # This returns start_date..end_date.
  #
  # Example:
  #
  #     week = Week.now
  #     week.date_range => Range(2012-01-02..2012-01-08)
  #
  # Return:
  #
  #  * [Range] start_date..stop_date
  #
  def date_range
    start_date..stop_date
  end

  # Does the week includes the date?
  #
  # Example:
  #
  #   date = Date.today
  #   week = Week.new(date)
  #   week.include?(date + 1) => true
  #   week.include?(date + 7) => false
  #
  # Return:
  #
  #   * [true/false]
  #
  def include?(date)
    (start_date..end_date).include?(date)
  end

end
