class CreateEventInfo < ActiveRecord::Migration[7.2]
  def change
    create_table :event_infos do |t|
      t.string :eventName
      t.string :level
      t.text :descripcion
      t.string :exhibitor
      t.datetime :date

      t.timestamps
    end
  end
end
