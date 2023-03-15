class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :every_day
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end
