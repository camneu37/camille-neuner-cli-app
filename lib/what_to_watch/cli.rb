class WhatToWatch::CLI

  def show_series_details(show)
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
  end

  def start
    WhatToWatch::Shows.create_from_list
    puts "Welcome to What to Watch!"
    puts "Please follow the instructions below to see the lists of Showtime series available for streaming."
    puts "Please enter '1' if you'd like to see the series starting with the letters A-I."
    puts "Please enter '2' if you'd like to see the series starting with the letters J-R."
    puts "Please enter '3' if you'd like to see the series starting with the letters S-Z."
    puts "Please enter '4' if you'd like to see the series starting with numerals."
    input = gets.strip
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
    puts "Would you like to see further details for any of these shows?"
    puts "If you'd like to see further details for one of these shows, please enter the number of the show."
    puts "Otherwise, enter 'more' if you'd like to see more show options."
    input = gets.strip
    index = input - 1
    show = WhatToWatch::Shows.find_by_index(index)
    show_series_details(show)
    puts " "
    puts "Would you like to see information for another show?"
    puts "If yes, please enter the number of the show. Otherwise, please enter 'no'."
  end

end
