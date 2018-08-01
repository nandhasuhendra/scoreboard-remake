class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.text       :name
      t.text       :description
      t.integer    :score
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
