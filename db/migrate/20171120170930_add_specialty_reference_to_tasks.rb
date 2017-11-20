class AddSpecialtyReferenceToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :specialty, foreign_key: true
  end
end
