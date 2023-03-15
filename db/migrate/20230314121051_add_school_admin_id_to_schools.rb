class AddSchoolAdminIdToSchools < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :school_admin_id, :integer
  end
end
