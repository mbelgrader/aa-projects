class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.string :contact_id, null: false
      t.string :user_id, null: false
    end

    add_index :contact_shares, [:user_id, :contact_id], unique: true
  end
end
