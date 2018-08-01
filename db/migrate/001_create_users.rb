class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text    :username
      t.integer :active, default: 1
      t.text    :token
      t.boolean :is_admin, default: false
      t.boolean :is_deleted, default: false
      t.text    :password_digest

      t.timestamps
    end
  end
end
