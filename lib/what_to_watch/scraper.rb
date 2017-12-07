class WhatToWatch::Scraper

  def scrape_series_showtime
    doc = Nokogiri::HTML(open("http://www.sho.com/series"))
  end

end
