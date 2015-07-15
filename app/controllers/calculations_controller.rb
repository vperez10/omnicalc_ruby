class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length 

    @character_count_without_spaces = @text.length-@text.count(" ")

    @word_count = @text.split.count 

    @occurrences =  "replace this" #insert code here
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
 
  n = @apr * @principal
 
  d = 1 - (1 + @apr)**-@years

    @monthly_payment = n/(d*12)
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending-@starting
    @minutes = (@ending-@starting)/60
    @hours = (@ending-@starting)/3600
    @days = (@ending-@starting)/86400
    @weeks = (@ending-@starting)/604800
    @years = (@ending-@starting)/31536000
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',',' ').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort 

    @count = @numbers.count 

    @minimum = @numbers.min 

    @maximum = @numbers.max 

    @range = "Replace this string with your answer."

    @median = (@minimum + @maximum)/2

    @sum = @numbers.sum

    @mean = @sum/@count 

    @variance = (@median-@mean)**2 

    @standard_deviation = Math.sqrt(@variance)

    @mode = "Replace this string with your answer."
  end
end
