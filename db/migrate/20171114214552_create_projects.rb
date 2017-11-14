class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.decimal :projected_buget
      t.string :address
      t.boolean :status

      t.timestamps
    end
  end
end
