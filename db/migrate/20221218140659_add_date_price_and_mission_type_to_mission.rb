class AddDatePriceAndMissionTypeToMission < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :date, :date
    add_column :missions, :price, :integer
    add_column :missions, :mission_type, :integer
  end
end
