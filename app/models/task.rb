class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
  validates :budget, presence: true
  validates :status, inclusion: { in: [ "Stand by", "Pending Ok", "Pending Blocked", "Closed", "Adandonned", "Completed" ] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :budget, presence: true
  validates :specialty, presence: true
end
