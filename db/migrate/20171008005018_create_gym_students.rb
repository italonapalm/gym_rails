class CreateGymStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :gym_students do |t|
      t.references :gym, foreign_key: true
      t.references :student, foreign_key: true
      t.boolean :active
      t.datetime :registration_date

      t.timestamps
    end
  end
end
