class AddDefaultToDependencies < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :dependencies, :string, default: ""
    change_column :specialties, :dependencies, :string, default: ""
  end
end
