class AddActivityToPoints < ActiveRecord::Migration
  def change
    add_column :points, :activity, :string
  end
end
