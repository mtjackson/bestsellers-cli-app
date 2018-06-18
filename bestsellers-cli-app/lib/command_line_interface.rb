require_relative "../lib/scraper.rb"
require_relative "..lib/book_details.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInterface

  def call
    puts "Welcome! Let's see what today's bestselling books are."
    start
  end

  def make_books
    book_array = Scraper.new.scrape_book_list
    BookDetails.create_from_collection(book_array)
  end

  def start
    puts ""
    puts "What genre book would you like to see? (fiction/nonfiction)"
    input = gets.strip

    if input == "fiction"
      puts ""
      puts "Here are the top five best selling fiction books today:"
      print_top_five("fiction")
    elsif input == "nonfiction"
      puts ""
      puts "Here are the top five best selling nonfiction books today:"
      print_top_five("nonfiction")
    else
      puts "I'm sorry, I don't understand that."
      start
    end
  end

  def print_top_five(genre)
    if genre == "fiction"
      puts ""
      puts "---------- Top Five Best-Selling Fiction ----------"
      puts ""
      BookDetails.all_fiction.each do |book|
        puts "#{book.rank}. " + "#{book.title}".colorize(:light_blue) + " #{book.author}"
        puts "#{book.description}"
        puts ""
      end
    end
  end

  def print_book_detail(book)
  end

end

#welcome
#ask what genre book you'd like to see
#get user input
#display top five books
#ask what book you'd like more information on
#get user input
#display book details
#ask if you'd like to see another book
#if no, thanks and exit
#if yes, ask what genre book you'd like to see

#make books
#add book attributes from book page
#display books
