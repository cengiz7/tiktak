class CreateProjectUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :project_users do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean  :is_author, default: false, null: false

      t.timestamps
    end
  end
end
