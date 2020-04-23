class Match < ApplicationRecord
  # the current user
  belongs_to :user
  # the user they want to match with
  belongs_to :crush, class_name: User
end
