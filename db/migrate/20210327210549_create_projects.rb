class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.boolean :archived, default: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end