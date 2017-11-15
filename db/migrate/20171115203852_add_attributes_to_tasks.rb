class AddAttributesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :description, :string
    add_column :tasks, :status, :string
    add_column :tasks, :start_date, :datetime
    add_column :tasks, :end_date, :datetime
    add_column :tasks, :zone, :string
    add_column :tasks, :budget, :integer
    add_column :tasks, :priority, :integer
    add_column :tasks, :parent_task, :string
    add_column :tasks, :dependencies, :string
    add_column :tasks, :specialty, :string
  end
end
