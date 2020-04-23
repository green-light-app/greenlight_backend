class User < ApplicationRecord
  has_many :matches
  has_many :inverse_matches, foreign_key: :matchuser_id, class_name: Match
  has_one :info
end
