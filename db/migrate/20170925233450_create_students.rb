class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.date :birthdate
      t.string :cpf
      t.string :rg
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
