class ChangeDateFormatInRequestse < ActiveRecord::Migration[6.0]
  def up
    change_column :requests, :email_confirmation_date, :datetime
    change_column :requests, :reconfirmation_date, :datetime
   end
 
   def down
    change_column :requests, :email_confirmation_date, :date
    change_column :requests, :reconfirmation_date, :date
   end
end
