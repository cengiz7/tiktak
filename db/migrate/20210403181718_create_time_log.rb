class CreateTimeLog < ActiveRecord::Migration[6.1]
  def change
    create_table :time_logs do |t|
      t.belongs_to :user
      t.text :comment, default: ''
      t.integer :time_log_type
      t.datetime :started_at
      t.datetime :finished_at

      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
