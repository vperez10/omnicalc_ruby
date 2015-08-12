class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]
    @special_word_lc=@special_word.downcase
    @text_lc=@text.downcase

    @character_count_with_spaces = @text.length
    @character_count_without_spaces = @text.length-@text.count(" ")
    @word_count = @text.split.count
    @occurrences = @text_lc.split.count(@special_word_lc)
end

def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    n = @apr * 12

    rate = @apr/100/12

    @monthly_payment = (rate * @principal)/(1-(1+rate)**(-n))
end

def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])


    @seconds = @ending-@starting
    @minutes = @seconds/60
    @hours = @seconds/3600
    @days = @seconds/86400
    @weeks = @seconds/604800
    @years = (@seconds/31536000).round(3)
end

def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',',' ').split.map(&:to_f)
    @sorted_numbers = @numbers.sort
    @count = @numbers.count
    @minimum = @numbers.min
    @maximum = @numbers.max
    @range = @maximum - @minimum
    @median = (@minimum + @maximum)/2
    @sum = @numbers.sum
    @mean = @sum/@count
    @mode = @numbers.uniq.max_by{ |i| @numbers.count( i ) }
    squared_differences = []
    @numbers.each do |num|
      difference = num - @mean
      squared_difference = difference ** 2
      squared_differences.push(squared_difference)
      @variance = squared_differences.sum/@count
      @standard_deviation = Math.sqrt(@variance)
  end

end
end
