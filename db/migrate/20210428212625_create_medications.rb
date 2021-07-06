class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :name 
      t.text :kind
      t.float :dose
      t.integer :frequency
      t.timestamps
    end
  end
end
