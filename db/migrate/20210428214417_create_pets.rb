class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name 
      t.integer :age 
      t.string :breed 
      t.text :condition
      t.timestamps
    end
  end
end
