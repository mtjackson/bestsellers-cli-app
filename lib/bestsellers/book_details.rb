class Bestsellers::BookDetails
  attr_accessor :rank, :title, :author, :description, :book_url, :genre, :summary, :about_author, :publisher, :publish_date

  @@all = []

  def initialize(book_hash)
    self.send(:rank=, book_hash[:rank])
    self.send(:title=, book_hash[:title])
    self.send(:author=, book_hash[:author])
    self.send(:description=, book_hash[:description])
    self.send(:book_url=, book_hash[:book_url])
    self.send(:genre=, book_hash[:genre])

    @@all << self
  end

  def self.create_from_collection(books_array)
    books_array.each do |book|
      Bestsellers::BookDetails.new(book)
    end
  end

  def add_book_details(details_hash)
    details_hash.each do |attribute, value|
      self.send(:"#{attribute}=", value)
    end
  end

  def self.all_fiction
    @@all.select do |book|
      book.genre == "Fiction"
    end
  end

  def self.all_nonfiction
    @@all.select do |book|
      book.genre == "Nonfiction"
    end
  end

  def self.all
    @@all
  end

end
