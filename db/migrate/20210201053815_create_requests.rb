class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :biography
      t.date :email_confirmation_date
      t.integer :status, default: 0
      t.date :reconfirmation_date

      t.timestamps
    end
  end
end
