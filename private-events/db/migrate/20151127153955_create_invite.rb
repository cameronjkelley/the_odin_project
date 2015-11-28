class CreateInvite < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps null: false
    end
  end
end
