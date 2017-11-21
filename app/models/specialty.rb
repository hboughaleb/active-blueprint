class Specialty < ApplicationRecord

  include Gantt::GanttInstanceMethods
  extend Gantt::GanttClassMethods

  belongs_to :project
  has_many :tasks

  has_many :users, through: :tasks

  SPECIALTIES = ['plumber', 'electrician', 'carpenter', 'mason', 'roofer']

end
