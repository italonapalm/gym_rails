class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :neighborhood
      t.integer :number
      t.string :complement
      t.string :address
      t.string :reference
      t.references :city, foreign_key: true
      t.string :street

      t.timestamps
    end
  end
end
