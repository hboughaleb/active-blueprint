class RemoveReferenceFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:tasks, :project, polymorphic: true)
  end
end
