class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :description
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
