class Specialty < ApplicationRecord
  belongs_to :project
  has_many :tasks

  SPECIALTIES = ['plumber', 'electrician', 'carpenter', 'mason', 'roofer']
end
