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
    puts "Please enter '1' if you'd like to see the series starting with the letters A-F."
    puts "Please enter '2' if you'd like to see the series starting with the letters G-M."
    puts "Please enter '3' if you'd like to see the series starting with the letters N-Z."
    puts "Please enter '4' if you'd like to see the series starting with numerals."
    input = gets.strip
    if input == "1"
      list_a_to_f
    elsif input == "2"
      list_g_to_m
    elsif input == "3"
      list_n_to_z
    elsif input == "4"
      list_num
    else
      puts "Entry invalid. Please try again."
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
