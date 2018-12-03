class Book

  attr_accessor :id, :title, :author, :description

  def self.open_connection
    conn = PG.connect(dbname: "blog", user: "postgres", password: "Acad3my1")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM books ORDER BY id"
    results = conn.exec(sql)
    books = results.map do |book_details|
      self.hydrate book_details
    end
    return books
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM books WHERE id = #{id}"
    result = conn.exec(sql)
    book = self.hydrate result[0]
  end

  def save
    conn = Book.open_connection
    if (!self.id)
      sql = "INSERT INTO books (title,author,description) VALUES ('#{self.title}','#{self.author}','#{self.description}')"
    else
      sql = "UPDATE books SET title = '#{self.title}',author ='#{self.author}',description = '#{self.description}' WHERE id = '#{self.id}'"
    end
    conn.exec(sql)
  end

  def self.rip id
    conn = Book.open_connection
    sql = "DELETE FROM books WHERE id = #{id}"
    result = conn.exec(sql)
  end

  def self.hydrate book_data
    book = Book.new
    book.id = book_data['id']
    book.title = book_data['title']
    book.author = book_data['author']
    book.description = book_data['description']
    return book
  end
end
