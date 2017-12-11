class WhatToWatch::Shows
  attr_accessor :name, :about, :airs, :episodes
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    add_show_attributes
  end

  def add_show_attributes
    show_link = "http://www.sho.com/#{self.name.downcase.gsub(" ", "-")}"
    show = WhatToWatch::Scraper.new.scrape_show_details(show_link)
    @about = show[:about]
    @airs = show[:airs]
    @episodes = show[:episodes]
  end

  def self.create_from_list
    series_list.each do |show|
      WhatToWatch::Shows.new(show)
    end
    binding.pry
  end

  def self.list_all
    series_list.uniq.sort.each.with_index(1) do |show, i|
      puts "#{i}. #{show}"
    end
  end

  def self.series_list
    WhatToWatch::Scraper.new.scrape_series_list
  end

  def self.all
    @@all
  end

end
