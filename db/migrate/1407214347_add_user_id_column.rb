class AddUserIdColumn < ActiveRecord::Migration
  change_table :to_do_items do |t|
    t.integer :user_id
  end
end
