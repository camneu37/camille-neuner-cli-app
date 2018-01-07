class WhatToWatch::Shows
  attr_accessor :name, :about, :airs, :episodes, :link
  @@all = []

  def initialize
    @@all << self
  end

  def add_show_attributes
    show_link = "http://www.sho.com/#{self.link}"
    show = WhatToWatch::Scraper.new.scrape_show_details(show_link)
    @about = show[:about]
    @airs = show[:airs]
    @episodes = show[:episodes]
  end

  def self.find_by_name(name)
    WhatToWatch::Shows.all.detect do |show|
      show.name == name
    end
  end

  def self.find_by_index(index)
    sorted_shows[index]
  end

  def self.sorted_shows
    all.sort_by{|s| s.name}
  end

  def self.create_from_list
    series_list.each do |show|
      name = show[:name]
      if find_by_name(name) == nil
        new_show = WhatToWatch::Shows.new
        new_show.name = show[:name]
        new_show.link = show[:link]
        new_show.add_show_attributes
      end
    end
  end

  def self.list_shows(params)
    lp = params.split(//)
    lp.each do |letter|
      sorted_shows.each.with_index(1) do |show, i|
        if show.name.start_with?(letter)
          puts " "
          puts "------------------------------------------------------------"
          puts "#{i}. #{show.name}"
          puts "------------------------------------------------------------"
          puts " "
        end
      end
    end
  end

  def self.series_list
    WhatToWatch::Scraper.new.scrape_series_list
  end

  def self.all
    @@all
  end

end
