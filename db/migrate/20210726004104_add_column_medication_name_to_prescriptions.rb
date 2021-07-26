class AddColumnMedicationNameToPrescriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :medication_name, :string
  end
end
