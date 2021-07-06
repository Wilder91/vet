class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.integer :doctor_id 
      t.integer :medicine_id 
      t.integer :pet_id
      t.integer :dosage
      t.timestamps
    end
  end
end
