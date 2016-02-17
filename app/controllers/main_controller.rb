class MainController < ApplicationController


  def try

    # if cookie: secret number is empty, then
    if cookies[:secret_number].nil?
      # run the random number generator and assign it to cookie: secret number
      cookies[:secret_number] = rand(100)
    end
    # assigns instance cookie: (integer) secret number to instance var secret number
    @secret_number = cookies[:secret_number].to_i

    # checks to see if cookies: counter is empty...
    if cookies[:counter].nil?
      # if it's empty then it sets cookies: counter to 5
      cookies[:counter] = 5
    end
    # and assigns cookies: (integer) counter to instance var counter
    @counter = cookies[:counter].to_i

    # checks to see if parameter guess taken from the url is empty
    if params[:guess].nil?
      # just checks to see if it's empty but does not execute any code if it IS empty
    else
      # if parameter guess taken from url is NOT empty, then it params:guess is assigned to instance var guess - as an integer
      @guess = params[:guess].to_i

      # checks to see if instance var secret number  is equal to the instance var guess
      if @secret_number == @guess
        # if above statement is true then assigns "You Won" to instance var result.
        @result = "You Won!"
        # if above statement is true, then cookies: secret number is reset to another random number
        cookies[:secret_number] = rand(100)
        # if above statement is true, then cookies:counter is reset to 5
        cookies[:counter] = 5

        # if if-statement is false, then the counter counts down by 1
      elsif @counter > 0
        @counter = @counter - 1
        # and re-assigns instance var counter to cookies:counter.
        # needs reassignment because the counter minus one equals 4, and in order to keep counting down it needs to be reassigned to cookies: counter. otherwise it will always start at 5.
        cookies[:counter] = @counter
        # if if-statement is false then tells the user that their guess was wrong and that they have x more tries left to guess the secret number
        if cookies[:counter].to_i == 0
          @result = "You lost, enter a new guess to start again"
          cookies[:secret_number] = rand(100)
          cookies[:counter] = 5

        else
          @result = @guess.to_s + " is wrong!" + " you only have " + @counter.to_s + " guesses left."
        end


      end
    end
  end
end
