class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text    :username
      t.text    :password
      t.integer :active, default: 1
      t.text    :token
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
