class Project < ApplicationRecord
  has_attachment :cover

  belongs_to :user
  has_many :specialties, dependent: :destroy
  has_many :tasks, through: :specialties
  has_many :contributors, through: :tasks, source: :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :budget, presence: true
  validates :address, presence: true
  validates :status, inclusion: { in: [ true, false ] }

  def total_progress
    total = 0;
    if specialties.any?
      specialties.each { |specialty| total += specialty.progress }
      total / specialties.length
    end
  end

  PROJECT_TEMPLATE = {

    villa: {
      specialties:{
        carpentry: {
          name: "Carpentry",
          start: 10,
          finish: 40,
          percentage_budget: 20,
          dependencies: "",
          custom_class: "carpenting-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Install cabinetry",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "task1"
            },
          task2: {
              name: "Phase 2",
              description: "Drywall installation",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "task2"
            },
            task3: {
              name: "Phase 3",
              description: "Molding installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "task3"
            }
          }
        },
        plumbing: {
          name: "Plumbing",
          start: 10,
          finish: 40,
          percentage_budget: 0,
          dependencies: "",
          custom_class: "plumbing-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Drain/Waste/Vent installation",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 31,
              custom_class: "task1"
            },
          task2: {
              name: "Phase 2",
              description: "Water and gas piping",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 32,
              custom_class: "task2"
            },
            task3: {
              name: "Phase 3",
              description: "Fixture and faucet installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 37,
              custom_class: "task3"
            }
          }
        }
      }
    },
    apartment: {
       specialties:{
        carpentry: {
          name: "Carpentry",
          start: 10,
          finish: 40,
          percentage_budget: 0,
          dependencies: "",
          custom_class: "carpenter-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Make it happen",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 25,
              custom_class: "task1"
            },
          task2: {
              name: "Phase 2",
              description: "Make it happen 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "task2"
            },
            task3: {
              name: "Phase 3",
              description: "Make it happen 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 50,
              custom_class: "task3"
            }
          }
        },
        plumbing: {
          name: "Plumbing",
          start: 10,
          finish: 40,
          percentage_budget: 0,
          dependencies: "",
          custom_class: "plumbing-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Make it happen",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 25,
              custom_class: "task1"
            },
          task2: {
              name: "Phase 2",
              description: "Make it happen 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "task2"
            },
            task3: {
              name: "Phase 3",
              description: "Make it happen 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 50,
              custom_class: "task3"
            }
          }
        }
      }
    }

  }

end

