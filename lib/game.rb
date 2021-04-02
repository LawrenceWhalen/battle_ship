class Game
  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    user_input = input

    while user_input != 'p' || 'q'
      if user_input == 'p'
        game
      elsif user_input == 'q'
        exit!
      else
        puts "Enter p to play. Enter q to quit."
        user_input = input
      end
    end


    # user_input = input
    # while user_input != 'p' || 'q'
    #   if user_input == 'p'
    #     game
    #   elsif user_input == 'q'
    #     exit!
    #   else
    #     puts "Enter p to play. Enter q to quit."
    #   end
    # end
  end

  def game
    exit!
  end

  def input
    gets.chomp
  end
end
