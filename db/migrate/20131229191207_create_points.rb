class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :value
      t.integer :user_id

      t.timestamps
    end

    add_index :points, [:user_id, :created_at]
  end
end
