class Library
  attr_reader :name, :people
  attr_accessor :books

  def initialize(options={})
    @name = options.fetch(:name)
    self.books = {}
    @people = {}
  end

  def add_book(book)
    books[book.title] = book
  end

  def add_person(person)
    people[person.name] = person
  end

  def list_people
    if people.empty?
      "Billy no mates."
    else
      people.map { |key, person| person.pretty_string }.join("\n")
    end
  end

  def list_books
    if books.empty?
      "Soz, no books here."
    else
      books.map { |key, book| book.pretty_string }.join("\n")
    end
  end

  def lend(person_name, book_title)
    person = people[person_name]
    book = books.delete(book_title)

    case 
    when !(person || book)
      puts "#{person_name} is not a member of the library, and #{book_title} is not currently available."
      return
    when !person
      puts "#{person_name} is not a member of the library."
      add_book(book)
      return
    when !book
      puts "#{book_title} is not currently available."
      return
    end

    person.borrow(book)
  end

  def return(person_name, book_title) 
    person = people[person_name]
    book = person.books[book_title]
    person.return(book)
    add_book(book)
  end

  def member_books(person_name)
    people[person_name].borrowed_books
  end
end
