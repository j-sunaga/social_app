class Relationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :friend, class_name: "User",optinal: true
end
