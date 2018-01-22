class WhatToWatch::Scraper

  def scrape_series_list
    doc = Nokogiri::HTML(open("http://www.sho.com/series"))
    shows = doc.css("li.promo")
    shows.each do |show|
      name = show.css("a.promo__link").text.upcase
      link = show.css("a.promo__link").attribute("href").value
      if WhatToWatch::Shows.find_by_name(name) == false
        WhatToWatch::Shows.new(name, link).add_show_attributes
      end
    end
  end

  def scrape_show_details(link)
    doc = Nokogiri::HTML(open(link))
    show_details = {}
    show_details[:about] = doc.css("p.block-container__copy").text
    show_details[:episodes] = doc.css("section.section--large h3.section-header").text
    show_details
  end


end
