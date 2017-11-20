class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :specialty

  validates :name, presence: true
  validates :budget, presence: true
  validates :status, inclusion: { in: [ "Stand by", "Pending Ok", "Pending Blocked", "Closed", "Adandonned", "Completed" ] }
  validates :start, presence: true
  validates :finish, presence: true
  validates :specialty, presence: true
end
