class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.text        :flag,      unique: true
      t.references  :user,      foreign_key: true
      t.references  :challenge, foreign_key: true
      
      t.timestamps
    end
  end
end
