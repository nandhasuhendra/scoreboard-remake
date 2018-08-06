class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :category, unique: true

      t.timestamps
    end
  end
end
