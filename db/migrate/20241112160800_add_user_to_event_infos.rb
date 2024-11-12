class AddUserToEventInfos < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_infos, :user, foreign_key: true, null: false # Cambié null: false a null: true
  end
end
