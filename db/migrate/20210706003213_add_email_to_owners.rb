class AddEmailToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :email, :string
  end
end
