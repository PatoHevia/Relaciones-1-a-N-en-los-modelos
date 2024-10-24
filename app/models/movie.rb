# app/models/movie.rb
class Movie < ApplicationRecord
    has_many :clients # Una película puede ser arrendada por muchos clientes
  end
  