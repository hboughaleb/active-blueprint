class Specialty < ApplicationRecord
  belongs_to :project
  has_many :tasks
  has_many :users, through: :tasks
end
