#require_relative "scraper.rb"
#require_relative "book_details.rb"
#require 'nokogiri'
#require 'colorize'

class Bestsellers::CommandLineInterface

  def call
    make_books
    add_book_attributes
    puts "Welcome! Let's see what today's bestselling books are."
    start
  end

  def make_books
    book_array = Scraper.scrape_book_list
    BookDetails.create_from_collection(book_array)
  end

  def add_book_attributes
    BookDetails.all_fiction.each do |book|
      details = Scraper.scrape_book_details(book.book_url)
      book.add_book_details(details)
    end
    BookDetails.all_nonfiction.each do |book|
      details = Scraper.scrape_book_details(book.book_url)
      book.add_book_details(details)
    end
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
    more_info(input)
  end

  def more_info(genre)
    puts ""
    puts "Would you like more information on a book? (Y/N)"
    input = gets.strip
    if input == "Y" || input == "y"
      puts ""
      puts "What book would you like more information on?"
      puts "(select 1-5)"
      i = gets.strip.to_i
      if i.between?(1, 5)
        puts ""
        print_book_detail(i, genre)
        anything_else
      else
        puts "I'm sorry, I don't understand that."
        more_info(genre)
      end
      puts ""
    elsif input == "N" || input == "n"
      puts ""
      puts "Goodbye!"
      exit
    else
      puts ""
      puts "I'm sorry, I don't understand that."
      more_info(genre)
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
    elsif genre == "nonfiction"
      puts ""
      puts "---------- Top Five Best-Selling Nonfiction ----------"
      puts ""
      BookDetails.all_nonfiction.each do |book|
        puts "#{book.rank}. " + "#{book.title}".colorize(:light_blue) + " #{book.author}"
        puts "#{book.description}"
        puts ""
      end
    end
  end

  def print_book_detail(book_rank, genre)
    if genre == "fiction"
      genre = "Fiction"
    elsif genre == "nonfiction"
      genre = "Nonfiction"
    end
    BookDetails.all.select do |book|
      if book.rank == book_rank && book.genre == genre
        puts "#{book.title}".colorize(:light_blue) + " #{book.author}"
        puts ""
        puts "Publisher:".colorize(:light_blue) + " #{book.publisher}"
        puts ""
        puts "Publication Date:".colorize(:light_blue) + " #{book.publish_date}"
        puts ""
        puts "Summary:".colorize(:light_blue)
        puts "#{book.summary}"
        if book.author != ""
          puts ""
          puts "About the Author:".colorize(:light_blue)
          puts "#{book.about_author}"
        end
      end
    end
  end

  def anything_else
    puts ""
    puts "Would you like to see another book? (Y/N)"
    input = gets.strip
    if input == "y" || input == "Y"
      start
    elsif input = "n" || input == "N"
      puts ""
      puts "Goodbye!"
      exit
    else
      puts ""
      puts "I'm sorry, I don't understand that"
      anything_else
    end
  end

end
