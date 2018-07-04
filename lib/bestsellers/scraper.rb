class Bestsellers::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

  def self.scrape_book_list
    scraped_books = []
    urls = ["/books/best-sellers/hardcover-fiction/", "/books/best-sellers/hardcover-nonfiction/"]
    self.get_page.css("section.subcategory").each do |category|
      category_list = []
      genre = category.css("h2.subcategory-heading a").attribute("data-version").text
      i = 1
      url = category.css("h2 a").attribute('href').value
      next unless urls.include?(url)
      category.css("li").each do |book|

        if book.css("h3.title").text != "" && urls.include?(url)
          scraped_books << {
            :genre => genre,
            :rank => i,
            :title => book.css("h3.title").text,
            :author => book.css("p.author").text,
            :description => book.css("p.description").text,
            :book_url => book.css("button").attribute("data-localbookstore").text
          }
          i+=1
        end
      end
    end
    scraped_books
  end

  def self.scrape_book_details(book_url)
    book_scraper = Nokogiri::HTML(open(book_url))
    book_details = {}

    book_details[:summary] = book_scraper.css("div.book-top-section").css("div")[8].text.strip
    if book_scraper.css("div.book-top-section").css("div")[9].text.include?("Buy at Local Store") == false
      book_details[:about_author] = book_scraper.css("div.book-top-section").css("div")[9].text.strip
    end
    book_details[:publisher] = book_scraper.css("p.ibc-pub-info")[0].text.strip
    book_details[:publish_date] = book_scraper.css("p.ibc-pub-info span").text.strip

    book_details
  end

end
