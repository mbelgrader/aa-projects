class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email, unique: true
      t.integer :user_id

      t.timestamps
    end

    add_index :contacts, [:email, :user_id], unique: true
  end
end
