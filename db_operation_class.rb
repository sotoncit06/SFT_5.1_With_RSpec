require 'active_record'
require 'logger'
require  'active_model'
require 'active_record/migration'
require 'csv'


class DatabaseConnection
def databaseConnection

  ActiveRecord::Base.establish_connection(

      :adapter  => "postgresql",
      :host     => "192.168.10.184",
      :username => "postgres",
      :port => 5432,
      :password => "Hello123",
      :database => "sarja",
      :reconnect => true

  )



end

def databaseConnectionClose

  ActiveRecord::Base.clear_all_connections!
end

end

class DatabaseTableOperation < ActiveRecord::Migration

  def table_create

    table_exist =ActiveRecord::Base.connection.table_exists? 'assertions'

    if table_exist == true

      drop_table :assertions

    end

    create_table :assertions do |t|

      t.string :assert_variable_name
      t.string :assert_value

    end


  end

end

class Assertion < ActiveRecord::Base


def insertAssertionValueIntoDatabaseFromFile(filename)

  CSV.foreach(filename, headers: true) do |row|
    Assertion.create(row.to_hash)
  end

=begin
    CSV.foreach("test.csv") do |row|
      Assertion.create({id: row[0], assert_value: row[1]})
    end

#Assertion.import("C:\/Users\/sarja\/RubymineProjects\/General_SFT_5.1\/test.csv")
=end #If the CSV file doesn't contain the column name from database

end

def findAssertedValueInDatabase(value)


  if Assertion.exists?(:assert_value => value)

    db_assert_value = Assertion.where(:assert_value => value).pluck(:assert_value)
    if db_assert_value.kind_of?(Array)
      return db_assert_value[0]
    end
    return db_assert_value

  end

end



end







