class WhatToWatch::CLI

  def self.list_all_shows
    WhatToWatch::Shows.all.sort_by{|s| s.name}.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name}"
    end
  end


end
