class AddBudgetToSpecialties < ActiveRecord::Migration[5.1]
  def change
    add_column :specialties, :budget, :float
  end
end
