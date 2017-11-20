class MakeChangesToTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :specialty
    remove_reference :tasks, :project, index: true, foreign_key: true
    change_table :tasks do |t|
      t.integer :progress
      t.string :custom_class
      t.rename :start_date, :start
      t.rename :end_date, :finish
      t.rename :title, :name

    end
  end
end
