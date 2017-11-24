Task.destroy_all
Specialty.destroy_all
Project.destroy_all
User.destroy_all

# user1 = User.create({
#   roles: "manager",
#   username: "johnjackson",
#   first_name: "John",
#   last_name: "Jackson",
#   email: "johnjackson@gmail.com",
#   password: "12345678",
#   phone_number: "555-456-7890",
#   address: "1 Boulevard St Laurent Montreal, QC"
#   })

# user2 = User.create({
#   roles: "contributor",
#   username: "jenniehiggins",
#   first_name: "Jennie",
#   last_name: "Higgins",
#   password: "12345678",
#   email: "jenniehiggins@mail.com",
#   phone_number: "435-678-4321",
#   address: "567 Rue de Gaspe Montreal, QC"
#   })
# user3 = User.create({
#   roles: "contributor",
#   username: "saraquaspiak",
#   first_name: "Sara",
#   last_name: "Quaspiak",
#   password: "12345678",
#   email: "saraquaspiak@net.com",
#   phone_number: "213-564-5931",
#   address: "8 Chemin St Urbain Montreal, QC"
#   })
# user4 = User.create({
#   roles: "observer",
#   username: "billgarr",
#   first_name: "Bill",
#   last_name: "Garr",
#   password: "12345678",
#   email: "billgarr@mail.com",
#   phone_number: "654-932-1456",
#   address: "345 Boulevard St Catherine Montreal, QC"
#   })

# project1 = Project.create({
#   title: "Bill Garr's Villa",
#   start_date: "2017-11-20".to_date,
#   end_date:  "2018-12-20".to_date,
#   description: "1400sq ft Villa in the foothills of Mont Tremblant",
#   projected_budget: 500000,
#   address: "45 chemin Blue Ivy Mont Tremblant, QC",
#   status: "Pending Ok",
#   user: user1
#   })
# project2 = Project.create({
#   title: "Personal Apartment Remodel",
#   start_date: "2017-09-25".to_date,
#   end_date:  "2018-10-13".to_date,
#   description: "New kitchen, new bathroom and wall demoloition to create open concept",
#   projected_budget: 70000,
#   address: "200 Ile des Soeurs Verdun, QC",
#   status: "Stand by",
#   user: User.first
#   })

# specialty1 = Specialty.create({
#   name: "Plumber",
#   start: "2017-10-17".to_date,
#   finish: "2017-11-24".to_date,
#   progress: 50,
#   dependencies: "",
#   custom_class: "none",
#   project: project2
#   })

# specialty2 = Specialty.create({
#   name: "Electrician",
#   start: "2018-02-28".to_date,
#   finish: "2018-04-01".to_date,
#   progress: 10,
#   dependencies: "",
#   custom_class: "none",
#   project: project1
#   })

# specialty3 = Specialty.create({
#   name: "Carpenter",
#   start: "2017-09-25".to_date,
#   finish: "2017-10-31".to_date,
#   progress: 100,
#   dependencies: "#{specialty1.id}",
#   custom_class: "none",
#   project: project2
#   })

# specialty4 = Specialty.create({
#   name: "Mason",
#   start: "2018-07-14".to_date,
#   finish: "2018-09-14".to_date,
#   progress: 10,
#   dependencies: "",
#   custom_class: "none",
#   project: project1
#   })

#  puts specialty5 = Specialty.create({
#   name: "Roofer",
#   start: "2018-9-15".to_date,
#   finish: "2018-9-17".to_date,
#   progress: 10,
#   dependencies: "",
#   custom_class: "none",
#   project: project1
#   })

# task1_1 = Task.new({
#   name: "Task 1",
#   description: "whatever",
#   status: "Completed",
#   start: "2017-10-17".to_date,
#   finish: "2017-11-1".to_date,
#   budget: 1000,
#   zone: "Kitchen",
#   priority: 1,
#   user_id: user2.id,
#   specialty: specialty1,
#   dependencies: "",
#   progress: 100,
#   custom_class: ""
#   })

# task2 = Task.create({
#   name: "Task 2",
#   description: "Piping",
#   status: "Completed",
#   start: "2017-11-2".to_date,
#   finish: "2017-11-24".to_date,
#   budget: 4000,
#   zone: "Bathroom",
#   priority: 2,
#   user: user3,
#   specialty: specialty1,
#   dependencies: task1_1.id.to_s,
#   progress: 90,
#   custom_class: ""
#   })
# task3 = Task.create({
#   name: "Task 1",
#   description: "Wires",
#   status: "Completed",
#   start: "2017-09-25".to_date,
#   finish: "2017-10-31".to_date,
#   budget: 10000,
#   zone: "Dining room",
#   priority: 2,
#   user: user3,
#   specialty: specialty3,
#   dependencies: "",
#   progress: 90,
#   custom_class: "",
#   })
# task4 = Task.create({
#   name: "Task 2",
#   description: "Brick laying",
#   status: "Stand by",
#   start: "2018-07-14".to_date,
#   finish: "2018-09-14".to_date,
#   budget: 40000,
#   zone: "Exterior",
#   priority: 3,
#   user: user2,
#   specialty: specialty4,
#   dependencies: task3.id.to_s,
#   progress: 10,
#   custom_class: ""
#   })
# task5 = Task.create({
#   name: "Task 3",
#   description: "Roof build out",
#   status: "Stand by",
#   start: "2018-09-17".to_date,
#   finish: "2018-09-19".to_date,
#   budget: 20000,
#   zone: "Exterior",
#   priority: 4,
#   user: user1,
#   specialty: specialty5,
#   dependencies: task4.id.to_s,
#   progress: 10,
#   custom_class: ""
#   })




