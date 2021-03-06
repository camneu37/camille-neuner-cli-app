class WhatToWatch::CLI

  def start
    WhatToWatch::Scraper.new.scrape_series_list
    puts " "
    puts "-------------------------------------------------------------------------------------------------------"
    puts "Welcome to What to Watch!"
    show_list_intro
    input = gets.strip.downcase
    show_list(input)
    until input == "exit"
      ask_for_more
      input = gets.strip.downcase
      do_more(input)
    end
  end

  def show_list_intro
    puts " "
    puts "-------------------------------------------------------------------------------------------------------"
    puts "Please follow the instructions below to see the lists of Showtime series available for streaming."
    puts "If you'd like to see the series starting with the letters A-I, please type in '1' and press enter."
    puts "If you'd like to see the series starting with the letters J-R, please type in '2' and press enter."
    puts "If you'd like to see the series starting with the letters S-Z, please type in '3' and press enter."
    puts "If you'd like to see the series starting with numerals, please type in '4' and press enter."
    puts "If at any time you'd like to exit the program, please type in 'exit' and press enter."
    puts "-------------------------------------------------------------------------------------------------------"
    puts " "
  end

  def show_list(input)
    while input != "1" && input != "2" && input != "3" && input != "4" && input != "exit"
      invalid
      input = gets.strip.downcase
    end
    if input == "1"
      WhatToWatch::Shows.list_shows("ABCDEFGHI")
    elsif input == "2"
      WhatToWatch::Shows.list_shows("JKLMNOPQR")
    elsif input == "3"
      WhatToWatch::Shows.list_shows("STUVWXYZ")
    elsif input == "4"
      WhatToWatch::Shows.list_shows("1234567890")
    elsif input == "exit"
      puts " "
      puts "Thank you for using What To Watch. Have a nice day!"
      exit
    end
  end

  def ask_for_more
    puts "-------------------------------------------------------------------------------------------------------"
    puts "If you'd like to see further details for one of the listed shows, please type in the number of the show and press enter."
    puts "If you'd like to see more show options, please type in 'more' and press enter."
    puts "If you'd like to exit the program, please type in 'exit' and press enter."
    puts "-------------------------------------------------------------------------------------------------------"
    puts " "
  end

  def do_more(input)
    while input != "more" && input != "exit" && input.to_i == 0
      invalid
      input = gets.strip.downcase
    end
    if input == "more"
      show_list_intro
      input = gets.strip.downcase
      show_list(input)
    elsif input == "exit"
      puts " "
      puts "Thank you for using What To Watch. Have a nice day!"
      exit
    elsif input.to_i != 0
      input = input.to_i
      index = input - 1
      show = WhatToWatch::Shows.find_by_index(index)
      show_series_details(show)
    end
  end

  def invalid
    puts " "
    puts "Entry invalid. Please try again."
    puts " "
  end

  def show_series_details(show)
    puts "-------------------------------------------------------------------------------------------------------"
    puts " "
    puts "----------#{show.name}----------"
    puts "About the show: "
    puts " "
    puts "#{show.about}"
    puts " "
    puts "There are #{show.episodes} available to stream on Showtime Anytime."
    puts " "
    puts "-------------------------------------------------------------------------------------------------------"
    puts " "
  end

end
