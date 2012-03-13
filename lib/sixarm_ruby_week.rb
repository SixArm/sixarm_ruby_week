# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end

require 'date'


class Week

  attr :date

  def initialize(date)
    @date = date
  end


  # Return date.to_s

  def to_s
    @date.to_s
  end


  ### Instantiations


  # Return the week that starts today

  def self.now
    Week.new(Date.today)
  end


  # Parse date text to a week. 
  #
  # @example
  #   week = Week.parse('2012-01-02') 

  def self.parse(date_text)
    Week.new(Date.parse(date_text))
  end


  ### Comparable


  # Return the hash for object comparison.
  #
  # This is simply the has of the date, which means
  # that two week objects created with the same date
  # will compare equally.

  def hash
    date.hash
  end


  # Return week1.date == week2.date

  def ==(other)
    self.date == other.date
  end


  # Return week1.date.eql? week2.date

  def eql?(other)
    self.date == other.date
  end


  # Return week1.date <=> week2.date

  def <=>(other)
   return self.date <=> other.date
  end


  # Return week1.date < week2.date

  def <(other)
    self.date < other.date
  end


  # Return week1.date <= week2.date

  def <=(other)
    self.date <= other.date
  end


  # Return week1.date > week2.date

  def >(other)
    self.date > other.date
  end


  # Return week1.date >= week2.date

  def >=(other)
    self.date >= other.date
  end


  ### Math


  # Addition: week + other => week
  #
  # Return a date object pointing other weeks after self.
  # The other should be a numeric value.
  #
  # @example
  #     week = Week.parse('2012-01-02')
  #     week + 3 => three weeks later

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
  # @example
  #     date = date.parse('2012-01-02')
  #     week = Week.new(date)
  #     week - 3 => three weeks earlier
  #
  # @example 
  #     date = date.parse('2012-01-02')
  #     start_week =  Week.new(date)
  #     end_week =  Week.new(date + 21)
  #     end_week - start_week => 3

  def -(other)
    if other.is_a? Numeric
      return Week.new(date - (other * 7))
    elsif other.is_a? Week
      return ((self.date - other.date) / 7).round
    else
      raise TypeError
    end
  end

  
  ### Enumerable

  # Return the previous week, i.e. seven day earlier.

  def previous
    return self - 1
  end


  # Return the next week, i.e. seven day later.

  def next
    return self + 1
  end


  ### Ranges

 
  # Return the start date of this week.
  # This is the same as week.date.
  #
  # @example
  #   week = Week.parse('2012-01-02')
  #   week.start_date.to_s => '2012-01-02'

  def start_date
    @date
  end


  # Return the end date of this week.
  # This is the same as week.date + 6 days
  #
  # @example
  #   week = Week.parse('2012-01-02')
  #   week.end_date.to_s => '2012-01-08'

  def end_date
    @date + 6
  end


  # Return the range start_date..end_date
  #
  # @example
  #   week = Week.parse('2012-01-02')
  #   week.date_range => Range(2012-01-02..2012-01-08)
  
  def date_range
    start_date..end_date
  end


  # Return true iif the week includes the date, i.e. if the date is in start_date..end_date
  #
  # @example
  #   week = Week.parse('2012-01-02')
  #   week.include?(Date.parse('2012-01-05')) => true
  #   week.include?(Date.parse('2012-01-10')) => false

  def include?(date)
    (start_date..end_date).include?(date)
  end


end
