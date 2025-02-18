class AddColorToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :color, :string
  end
end
