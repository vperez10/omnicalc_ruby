class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]
    @special_word_lc=@special_word.downcase 
    @text_lc=@text.downcase 

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length 

    @character_count_without_spaces = @text.length-@text.count(" ")

    @word_count = @text.split.count 

    @occurrences = @text_lc.split.count{@special_word_lc}
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
def variance(list_of_numbers)
running_total = 0
count_for_mean = list_of_numbers.count
list_of_numbers.each do |number|
running_total = running_total + (((mean_first_dataset) - number)**2)
end

    @sorted_numbers = @numbers.sort 

    @count = @numbers.count 

    @minimum = @numbers.min 

    @maximum = @numbers.max 

    @range = @maximum - @minimum

    @median = (@minimum + @maximum)/2

    @sum = @numbers.sum

    @mean = @sum/@count 

    @variance = running_total/count_for_mean

    @standard_deviation = Math.sqrt(@variance)

    @mode = @numbers.uniq.max_by{ |i| @numbers.count( i ) }
  end
end
