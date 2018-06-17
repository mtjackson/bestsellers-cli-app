require_relative "../lib/scraper.rb"
require_relative "..lib/book_details.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInterface

  def make_books
    book_array = Scraper.new.scrape_book_list
    BookDetails.create_from_collection(book_array)
  end

  def start
    puts "What genre book would you like to see? (fiction/non-fiction)"
    input = gets.strip
  end

  def print_top_five(genre)
    if genre == "fiction"
      puts ""
      puts "---------- Top Five Best-Selling Fiction ----------"
      puts ""
      #add code to call this from book_details

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
