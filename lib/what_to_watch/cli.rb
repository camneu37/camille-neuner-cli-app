class WhatToWatch::CLI

  def start
    WhatToWatch::Shows.create_from_list
    puts " "
    puts "------------------------------------------------------------"
    puts "Welcome to What to Watch!"
    show_list_intro
    show_list(input)
    ask_for_more
    input = gets.strip
    if input.integer?
      index = input - 1
      show = WhatToWatch::Shows.find_by_index(index)
      show_series_details(show)
    elsif input == "more"
      show_list_intro
    end
    puts " "
    puts "Would you like to see information for another show?"
    puts "If yes, please enter the number of the show. Otherwise, please enter 'no'."
  end

  def show_list_intro
    puts "Please follow the instructions below to see the lists of Showtime series available for streaming."
    puts "If you'd like to see the series starting with the letters A-I, please type in '1' and press enter."
    puts "If you'd like to see the series starting with the letters J-R, please type in '2' and press enter."
    puts "If you'd like to see the series starting with the letters S-Z, please type in '3' and press enter."
    puts "If you'd like to see the series starting with numerals, please type in '4' and press enter."
    puts "------------------------------------------------------------"
    puts " "
    input = gets.strip
  end

  def show_list(input)
    until input == "1" || input == "2" || input == "3" || input == "4"
      puts "Entry invalid. Please try again."
      input = gets.strip
    end
    if input == "1"
      WhatToWatch::Shows.list_shows("ABCDEFGHI")
    elsif input == "2"
      WhatToWatch::Shows.list_shows("JKLMNOPQR")
    elsif input == "3"
      WhatToWatch::Shows.list_shows("STUVWXYZ")
    elsif input == "4"
      WhatToWatch::Shows.list_shows("1234567890")
    end
  end

  def ask_for_more
    puts "If you'd like to see further details for one of these shows, please type in the number of the show and press enter."
    puts "If you'd like to see more show options, please type in 'more' and press enter."
    puts "If you'd like to exit the program, please type in 'exit' and press enter."
    puts "------------------------------------------------------------"
    puts " "
  end

  def show_series_details(show)
    puts " "
    puts "----------#{show.name}----------"
    puts "About the show: "
    puts " "
    puts "#{show.about}"
    puts " "
    puts "There are #{show.episodes} available to stream on Showtime Anytime."
    puts " "
    if show.airs != "No airings currently scheduled"
      puts "This show will air on Showtime's channel #{show.airs}."
    else
      puts "There are no airings currently scheduled."
    end
    puts "------------------------------------------------------------"
    puts " "
  end

end
