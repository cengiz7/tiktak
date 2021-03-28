class AddColorCodeToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :color_code, :string
  end
end
