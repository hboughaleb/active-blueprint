class AddStatusToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :status, :boolean
  end
end
