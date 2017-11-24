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
        preparation: {
          name: "Preparation",
          start: 0,
          finish: 10,
          percentage_budget: 12,
          dependencies: "",
          custom_class: "preparation-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        masonry: {
          name: "Masonry",
          start: 10,
          finish: 20,
          percentage_budget: 14,
          dependencies: "",
          custom_class: "masonry-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description:"Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        plumbing: {
          name: "Plumbing",
          start: 20,
          finish: 30,
          percentage_budget: 17,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Water and gas piping",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 32,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Fixture and faucet installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 37,
              custom_class: "green"
            }
          }
        },
        electricity: {
          name: "Electricity",
          start: 30,
          finish: 40,
          percentage_budget: 14,
          dependencies: "",
          custom_class: "electricity-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        hvac: {
          name: "HVAC",
          start: 40,
          finish: 50,
          percentage_budget: 16,
          dependencies: "",
          custom_class: "hvac-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        tiling: {
          name: "Tiling",
          start: 50,
          finish: 80,
          percentage_budget: 17,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Water and gas piping",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 32,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Fixture and faucet installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 37,
              custom_class: "green"
            }
          }
        },
        carpentry: {
          name: "Carpentry",
          start: 80,
          finish: 100,
          percentage_budget: 10,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Drywall installation",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Molding installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        }
      }
    },
    apartment: {
      specialties:{
        preparation: {
          name: "Preparation",
          start: 0,
          finish: 10,
          percentage_budget: 12,
          dependencies: "",
          custom_class: "preparation-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        masonry: {
          name: "Masonry",
          start: 10,
          finish: 20,
          percentage_budget: 14,
          dependencies: "",
          custom_class: "masonry-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description:"Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        plumbing: {
          name: "Plumbing",
          start: 20,
          finish: 30,
          percentage_budget: 17,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Water and gas piping",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 32,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Fixture and faucet installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 37,
              custom_class: "green"
            }
          }
        },
        electricity: {
          name: "Electricity",
          start: 30,
          finish: 40,
          percentage_budget: 14,
          dependencies: "",
          custom_class: "electricity-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        hvac: {
          name: "HVAC",
          start: 40,
          finish: 50,
          percentage_budget: 16,
          dependencies: "",
          custom_class: "hvac-class",
          tasks: {
            task1: {
              name: "Phase 1",
              description: "Phase 1",
              status: "",
              start: 0,
              finish: 10,
              percentage_budget: 50,
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Phase 2",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Phase 3",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        },
        tiling: {
          name: "Tiling",
          start: 50,
          finish: 80,
          percentage_budget: 17,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Water and gas piping",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 32,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Fixture and faucet installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 37,
              custom_class: "green"
            }
          }
        },
        carpentry: {
          name: "Carpentry",
          start: 80,
          finish: 100,
          percentage_budget: 10,
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
              custom_class: "blue"
            },
          task2: {
              name: "Phase 2",
              description: "Drywall installation",
              status: "",
              start: 10,
              finish: 20,
              percentage_budget: 25,
              custom_class: "red"
            },
            task3: {
              name: "Phase 3",
              description: "Molding installation",
              status: "",
              start: 20,
              finish: 30,
              percentage_budget: 25,
              custom_class: "green"
            }
          }
        }
      }
    }

  }

end

