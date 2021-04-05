class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.belongs_to :user
      t.string :name, null: false

      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
