class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.text       :name,         unique: true
      t.text       :description
      t.text       :real_flag,    unique: true
      t.text       :token
      t.integer    :score
      t.references :category,     foreign_key: true

      t.timestamps
    end
  end
end
