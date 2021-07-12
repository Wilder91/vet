class RemoveColumnMedicineIdFromPrescriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :prescriptions, :medicine_id, :integer
  end
end
