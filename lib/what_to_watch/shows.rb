class WhatToWatch::Shows
  attr_accessor :name, :about, :episodes, :link
  @@all = []

  def initialize(name, link)
    @name = name
    @link = link
    @@all << self
  end

  def add_show_attributes
    show_link = "http://www.sho.com/#{self.link}"
    show = WhatToWatch::Scraper.new.scrape_show_details(show_link)
    @about = show[:about]
    @episodes = show[:episodes]
  end

  def self.find_by_name(name)
    WhatToWatch::Shows.all.any? do |show|
      show.name == name
    end
  end

  def self.find_by_index(index)
    sorted_shows[index]
  end

  def self.sorted_shows
    all.sort_by{|s| s.name}
  end

  def self.list_shows(params)
    puts " "
    puts "-------------------------------------------------------------------------------------------------------"
    lp = params.split(//)
    lp.each do |letter|
      sorted_shows.each.with_index(1) do |show, i|
        if show.name.start_with?(letter)
          puts "#{i}. #{show.name}"
        end
      end
    end
    puts "-------------------------------------------------------------------------------------------------------"
    puts " "
  end

  def self.all
    @@all
  end

end
