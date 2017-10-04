class AddActiveAndEmailAndSexToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :active, :boolean
    add_column :students, :email, :string
    add_column :students, :sex, :string, options: { limit: 1 }
  end
end
