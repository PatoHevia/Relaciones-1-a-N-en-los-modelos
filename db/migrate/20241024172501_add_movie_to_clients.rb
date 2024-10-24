class AddMovieToClients < ActiveRecord::Migration[7.2]
  def change
    add_reference :clients, :movie, foreign_key: true
  end
end
