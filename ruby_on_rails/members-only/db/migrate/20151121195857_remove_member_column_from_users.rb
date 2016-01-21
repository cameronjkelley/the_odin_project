class RemoveMemberColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :member
  end
end
