class CreateProfileRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_roles do |t|
      t.references :profile, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
