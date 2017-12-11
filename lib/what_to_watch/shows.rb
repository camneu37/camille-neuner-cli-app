class WhatToWatch::Shows
  attr_accessor :name, :about, :airs, :episodes

  def self.list_all
    series_list = WhatToWatch::Scraper.new.scrape_series_list
    series_list.uniq.sort.each.with_index(1) do |show, i|
      puts "#{i}. #{show}"
    end
  end


end
