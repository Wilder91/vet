class AddWeightToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :weight, :integer
  end
end
