class CreateWashRecords < ActiveRecord::Migration
  def change
    create_table :wash_records do |t|
      t.string :vehicle_type
      t.decimal :amount_charged
      t.boolean :muddy_bed
      t.boolean :bed_down
      t.string :license_plate
      t.references :user

      t.timestamps null: false
    end
  end
end
