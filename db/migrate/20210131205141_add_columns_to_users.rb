class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :biography, :text
    add_column :users, :phone_number, :string
    add_column :users, :waiting, :boolean, default: true
  end
end
