class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :task, foreign_key: true
      t.date :upload_date
      t.date :object_date
      t.string :type

      t.timestamps
    end
  end
end
