class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :wiki
end
