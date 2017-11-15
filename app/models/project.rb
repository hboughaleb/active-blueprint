class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :budget, presence: true
  validates :address, presence: true
  validates :status, inclusion: { in: [ true, false ] }

end