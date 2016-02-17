class MainController < ApplicationController


  def try

    # if cookie: secret number is empty, then
    if cookies[:secret_number].nil?
      # run the random number generator and assign it to cookie: secret number
      cookies[:secret_number] = rand(100)
    end
    @secret_number = cookies[:secret_number].to_i

    if cookies[:counter].nil?
      # run the random number generator and assign it to cookie: secret number
      cookies[:counter] = 5
    end
    @counter = cookies[:counter].to_i

    if params[:guess].nil?
      # Did not get a guess from browser/user
    else
      @guess = params[:guess].to_i

      if @secret_number == @guess
        @result = "You Won!"
        cookies[:secret_number] = rand(100)
        cookies[:counter] = 5
      else
        @counter = @counter - 1
        cookies[:counter] = @counter
        @result = @guess.to_s + " is wrong!" + " you only have " + @counter.to_s + " guesses left."

      end

    end
    # # if cookie: secret number is empty, then
    # if(cookies[:secret_number].nil?)
    #   # run the random number generator and assign it to cookie: secret number
    #   cookies[:secret_number] = rand(100)
    #   # else if the cookie: secret number is equal to the guess then tell the user that they won.
    #   cookies[:number] = 5
    # elsif @secret_number == params[:guess].to_i && @counter > 0
    #   @result = "you won!"
    #   # if the user has won, then generate a new random number
    #   cookies[:secret_number] = rand(100)
    #   # if the cookie: secret number is lower than the guess, alert the user: too high!
    #   cookies[:number] = 5
    # elsif @secret_number < params[:guess].to_i && @counter > 0
    #   @result = "too high!"
    #   # if the cookie: secret number is higher than the guess, alert user: too low!
    #   cookies[:number] -= 1
    # elsif @secret_number > params[:guess].to_i && @counter > 0
    #   @result = "too low!"
    #   cookies[:number] -= 1
    #
    # end

  end

end
