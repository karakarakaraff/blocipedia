class Wiki < ApplicationRecord
  has_many :collaborators
  has_many :users, through: :collaborators
  belongs_to :user
end
