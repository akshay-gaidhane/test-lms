class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.integer :sender_id
      t.integer :batch_id
      t.integer :monitored_by
      t.integer :status

      t.timestamps
    end
  end
end
