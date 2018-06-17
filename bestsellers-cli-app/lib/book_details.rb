class BookDetails
  attr_accessor :rank, :title, :author, :description, :url, :genre, :summary, :about_author, :rating

  @@all_fiction = []
  @@all_nonfiction = []

  def initialize(book_hash)
    self.send(:rank=, book_hash[:title])
    self.send(:author=, book_hash[:author])
    self.send(:description=, book_hash[:description])
    self.send(:url=, book_hash[:url])
    @@all_books << self
  end

  def self.create_from_collection(books_array)
    books_array.each do |book|
      book = BookDetails.new(book)
  end

  def add_book_details(details_hash)
    self.send(:summary=, details_hash[:summary])
    self.send(:about_author=, details_hash[:summary])
    self.send(:rating=, details_hash[:rating])
  end

end
