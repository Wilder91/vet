class AddPasswordToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :password, :string
  end
end
