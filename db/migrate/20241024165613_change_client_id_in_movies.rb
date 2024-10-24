class ChangeClientIdInMovies < ActiveRecord::Migration[6.1]
  def change
    change_column_null :movies, :client_id, true
  end
end
