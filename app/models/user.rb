class User < ApplicationRecord
  has_many :matches
  has_many :inverse_matches, foreign_key: :matchee_id, class_name: Match
  has_one :info

  def all_matches
   matches_array = matches.map{|match| match.matchee if match.confirmed}
   matches_array + inverse_matches.map{|match| match.user if match.confirmed}
   matches_array.compact
 end

  def pending_matches
    matches.map{|match| match.matchee if !match.confirmed}.compact
  end

  def friend_requests
    inverse_matches.map{|match| match.user if !match.confirmed}.compact
  end

  def confirm_match(user)
    match = inverse_match.find{|match| match.user == user}
    match.confirmed = true
    match.save
  end

  def match?(user)
    matches.include?(user)
  end

end
