class BookDetails
  attr_accessor :title, :author, :description, :url, :summary, :about_author, :rating

  @@all_books = []

  def initialize(book_hash)
    self.send(:title=, book_hash[:title])
    self.send(:title=, book_hash[:title])
    self.send(:title=, book_hash[:title])
    @@all_books << self
  end

  def self.create_from_collection(books_array)
    books_array.each{|book| book = BookDetails.new(book)}
  end

  def add_book_details(details_hash)
    self.send(:summary=, details_hash[:summary])
    self.send(:about_author=, details_hash[:summary])
    self.send(:rating=, details_hash[:rating])
  end

end
