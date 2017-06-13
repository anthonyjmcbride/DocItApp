class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :password
      t.integer :zipcode
      t.string :calendar

      t.timestamps
    end
  end
end
