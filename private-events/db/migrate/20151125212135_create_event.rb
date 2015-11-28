class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :description

      t.timestamps null: false
    end
  end
end
