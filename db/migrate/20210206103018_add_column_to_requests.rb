class AddColumnToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :accepted_at, :datetime
  end
end
