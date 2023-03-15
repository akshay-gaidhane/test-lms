class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :subdomain
      t.integer :user_id

      t.timestamps
    end
  end
end
