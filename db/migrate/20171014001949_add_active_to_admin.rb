class AddActiveToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :active, :boolean
  end
end
