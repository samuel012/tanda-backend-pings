class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :identifier, limit: 36

      t.timestamps
    end
  end
end
