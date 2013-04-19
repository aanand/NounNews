require 'sequel'

database_url = ENV['HEROKU_POSTGRESQL_CYAN_URL'] || 'sqlite://data/db.sqlite3'
DB = Sequel.connect(database_url)

unless DB.table_exists?(:tweets)
  DB.create_table :tweets do
    primary_key :id
    String :twitter_id
    String :headline_title
    String :headline_url
    DateTime :tweeted_at
  end
end

Tweet = DB[:tweets]

class << Tweet
  def has_been_tweeted?(url)
    filter(headline_url: url).count > 0
  end
end
