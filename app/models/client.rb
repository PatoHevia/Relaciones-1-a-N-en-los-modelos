# app/models/client.rb
class Client < ApplicationRecord
  belongs_to :movie, optional: true
  validate :unique_movie_rent

  private

  def unique_movie_rent
    if Client.where(movie_id: movie_id).exists?
      errors.add(:movie, "ya está siendo arrendada por otro cliente.")
    end
  end
end
