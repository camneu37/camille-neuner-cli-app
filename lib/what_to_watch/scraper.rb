class WhatToWatch::Scraper

  def scrape_series_list
    doc = Nokogiri::HTML(open("http://www.sho.com/series"))
    shows = doc.css("li.promo")
    all_shows = []
    shows.each do |show|
      all_shows << show.css("a.promo__link").text
    end
    all_shows
  end

end
