class CreateAdminProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_profiles do |t|
      t.references :admin, foreign_key: true
      t.references :profile, foreign_key: true
      t.boolean :active
    end
  end
end
