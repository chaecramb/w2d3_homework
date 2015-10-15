class Book

  attr_reader :title, :genre

  def initialize(options = {})
    @title = options.fetch(:title)
    @genre = options.fetch(:genre)
  end

  def pretty_string
    "#{title} #{genre}"
  end


end
