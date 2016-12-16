class AddNullConstraintToContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :name, :string, null: false
    change_column :contacts, :email, :string, null: false
    change_column :contacts, :user_id, :string, null: false
  end
end
