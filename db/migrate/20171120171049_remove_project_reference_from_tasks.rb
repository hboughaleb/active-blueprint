class RemoveProjectReferenceFromTasks < ActiveRecord::Migration[5.0]
  def change
    # remove_reference :tasks, :project, foreign_key: true
  end
end
