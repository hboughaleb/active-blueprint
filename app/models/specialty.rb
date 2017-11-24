class Specialty < ApplicationRecord

  include Gantt::GanttInstanceMethods
  extend Gantt::GanttClassMethods

  belongs_to :project
  has_many :tasks, dependent: :destroy

  has_many :users, through: :tasks

  SPECIALTIES = ['Preparation','Structural Systems / Masonry','Plumbing', 'HVAC', 'Electricity', 'Carpentry', 'Tiling', 'Windows', 'Roofing']

  def set_progress
    total = 0;
    if tasks.any?
      tasks.each { |task| total += task.progress }
      update(progress: total / tasks.length)
    end
  end
end
