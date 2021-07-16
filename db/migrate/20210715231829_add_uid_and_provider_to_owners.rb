class AddUidAndProviderToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :uid, :string
    add_column :owners, :provider, :string
  end
end
