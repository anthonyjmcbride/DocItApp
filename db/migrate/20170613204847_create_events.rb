class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :organizer
      t.string :category
      t.string :description
      t.string :datetime

      t.timestamps
    end
  end
end
