class CreateObservation < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.timestamps
      t.float :temp
      t.integer :humidity
      t.float :temp_min
      t.float :temp_max     
    end
  end
end
