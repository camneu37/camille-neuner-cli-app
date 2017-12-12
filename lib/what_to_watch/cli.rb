class WhatToWatch::CLI

  def list_all_shows
    WhatToWatch::Shows.all.sort_by{|s| s.name}.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name}"
    end
  end

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
    puts "Below you'll see a list of all available series from Showtime."
    list_all_shows
    puts "Please enter the number of the show for which you'd like more information."
    input = gets.strip.to_i
    end
  end

end
