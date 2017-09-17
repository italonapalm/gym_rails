class AddActiveToGym < ActiveRecord::Migration[5.1]
  def change
    add_column :gyms, :active, :boolean, default: true
  end
end
