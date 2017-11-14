class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :project, polymorphic: true, user: true

      t.timestamps
    end
  end
end
