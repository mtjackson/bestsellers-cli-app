class BookDetails
  attr_accessor :rank, :title, :author, :description, :url, :genre, :summary, :about_author, :rating

  @@all_fiction = []
  @@all_nonfiction = []

  def initialize(book_hash)
    self.send(:rank=, book_hash[:rank])
    self.send(:author=, book_hash[:author])
    self.send(:description=, book_hash[:description])
    self.send(:url=, book_hash[:url])
    if self.genre == "Fiction"
      @@all_fiction << self
    elsif self.genre == "Nonfiction"
      @@all_nonfiction << self
    end
  end

  def self.create_from_collection(books_array)
    books_array.each do |book_list|
      book_list.each do |book|
        book = BookDetails.new(book)
      end
    end
  end

  def add_book_details(details_hash)
    self.send(:summary=, details_hash[:summary])
    self.send(:about_author=, details_hash[:summary])
    self.send(:rating=, details_hash[:rating])
  end

end
