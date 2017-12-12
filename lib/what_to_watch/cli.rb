class WhatToWatch::CLI

  def self.list_all_shows
    WhatToWatch::Shows.all.sort_by{|s| s.name}.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name}"
    end
  end

  def self.start
    WhatToWatch::Shows.create_from_list
    puts "Welcome to What to Watch!"
    puts "Below you'll see a list of all available series from Showtime."
    puts "Please enter the number of the show for which you'd like more information."
    list_all_shows
    binding.pry
    input = gets.strip
  end

end
