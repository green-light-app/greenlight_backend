class Match < ApplicationRecord
  # the current user
  belongs_to :user
  # the user they want to match with
  belongs_to :matchee, class_name: User
end
