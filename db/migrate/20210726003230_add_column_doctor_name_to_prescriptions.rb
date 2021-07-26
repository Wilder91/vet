class AddColumnDoctorNameToPrescriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :doctor_name, :string
  end
end
