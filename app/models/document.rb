class Document < ApplicationRecord
  belongs_to :task

  validates :status, inclusion: { in: [ true, false ] }
  validates :upload_date, presence: true
  validates :object_date, presence: true

end
