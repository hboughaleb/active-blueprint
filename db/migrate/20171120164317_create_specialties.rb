class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish
      t.integer :progress
      t.string :dependencies
      t.string :custom_class
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
