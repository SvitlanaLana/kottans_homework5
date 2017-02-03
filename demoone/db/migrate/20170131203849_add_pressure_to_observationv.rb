class AddPressureToObservationv < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :pressure, :integer
  end
end
