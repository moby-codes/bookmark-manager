require 'pg'

# new class
class Bookmark

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager')
    end
    result = connection.exec ( "SELECT url FROM bookmarks" )
    result.map { |row| row["url"] }
  end

end
