class AddPasswordConfirmationToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :password_confirmation, :string
  end
end
