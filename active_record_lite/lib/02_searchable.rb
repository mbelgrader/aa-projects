require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    search_keys = params.map { |k, v| "#{k} = ?"}.join(' AND ')

    result = DBConnection.execute(<<-SQL, params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{search_keys}
    SQL

    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
