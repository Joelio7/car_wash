class AddStatusAndLocationToWashRecord < ActiveRecord::Migration
  def change
    add_column :wash_records, :status, :string
    add_column :wash_records, :location, :string
  end
end
