class CreatePings < ActiveRecord::Migration[5.2]
  def change
    create_table :pings do |t|
      t.references :device, foreign_key: true
      t.datetime :datetimestamp

      t.timestamps
    end
  end
end
