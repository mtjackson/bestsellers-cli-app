class BookDetails
  attr_accessor :rank, :title, :author, :description, :book_url, :genre, :summary, :about_author, :rating

  @@all = []
  @@all_fiction = []
  @@all_nonfiction = []

  def initialize(book_hash)
    self.send(:rank=, book_hash[:rank])
    self.send(:title=, book_hash[:title])
    self.send(:author=, book_hash[:author])
    self.send(:description=, book_hash[:description])
    self.send(:book_url=, book_hash[:book_url])
    self.send(:genre=, book_hash[:genre])
    if self.genre == "Fiction"
      @@all_fiction << self
    elsif self.genre == "Nonfiction"
      @@all_nonfiction << self
    end
    @@all << self
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

  def self.all_fiction
    @@all_fiction
  end

  def self.all_nonfiction
    @@all_nonfiction
  end

  def self.all
    @@all
  end

end
