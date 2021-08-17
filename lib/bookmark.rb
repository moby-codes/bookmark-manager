require 'pg'

# new class
class Bookmark

  def self.all
    connection = PG.connect( dbname: 'bookmark_manager')
    result = connection.exec ( "SELECT url FROM bookmarks" )
    result.map { |row| row["url"] }
  end

end
