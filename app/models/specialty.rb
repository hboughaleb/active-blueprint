class Specialty < ApplicationRecord

  include Gantt::GanttInstanceMethods
  extend Gantt::GanttClassMethods

  belongs_to :project
  has_many :tasks, dependent: :destroy

  has_many :users, through: :tasks

  SPECIALTIES = ['Preparation','Masonry','Plumbing', 'HVAC', 'Electricity', 'Carpentry', 'Tiling', 'Windows', 'Roofing']

end
