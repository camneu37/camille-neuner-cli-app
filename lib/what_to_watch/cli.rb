class WhatToWatch::CLI

  def self.list_all_shows
    WhatToWatch::Shows.all.sort_by{|s| s.name}.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name}"
    end
  end

  def self.show_series_details(show)
    puts " "
    puts "#{show.name}"
    puts " "
    puts "About the show: "
    puts " "
    puts "#{show.about}"
    puts " "
    puts "There are #{show.episodes} available to stream on Showtime Anytime"
    puts " "
    if show.airs != "No airings currently scheduled"
      puts "This show will air on Showtime's channel #{show.airs}"
    end
  end

  def self.start
    WhatToWatch::Shows.create_from_list
    puts "Welcome to What to Watch!"
    puts "Below you'll see a list of all available series from Showtime."
    list_all_shows
    puts "Please enter the number of the show for which you'd like more information."
    input = gets.strip.to_i
    end
  end

end
