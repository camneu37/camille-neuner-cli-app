class WhatToWatch::Scraper

  def scrape_series_list
    doc = Nokogiri::HTML(open("http://www.sho.com/series"))
    shows = doc.css("li.promo")
    all_shows = []
    shows.each do |show|
      all_shows << show.css("a.promo__link").text.upcase
    end
    all_shows
  end

  def scrape_show_details(link)
    doc = Nokogiri::HTML(open(link))
    show_details = {}
    show_details[:about] = doc.css("p.block-container__copy").text
    show_details[:airs] = doc.css("div.ways-to-watch__section p.ways-to-watch__date_time").text
    show_details[:episodes] = doc.css("section.section--large h3.section-header").text
    show_details
  end


end
