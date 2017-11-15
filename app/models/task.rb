class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
  validates :budget, presence: true
  validates :status, inclusion: { in: [ true, false ] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :budget, presence: true
  validates :specailty, presence: true
end
