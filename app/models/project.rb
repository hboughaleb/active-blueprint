class Project < ApplicationRecord
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


  PROJECT_TEMPLATE = {

    villa: {
      specialties:{
        carpenter: {
          name: "Carpenter",
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
        plumber: {
          name: "Plumber",
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
    },
    apartment: {
       specialties:{
        carpenter: {
          name: "Carpenter",
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

