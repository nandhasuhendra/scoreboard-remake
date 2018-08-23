class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text    :teamname,        unique: true
      t.text    :username,        unique: true
      t.text    :token
      t.boolean :is_admin,        default: false
      t.text    :password_digest

      t.timestamps
    end
  end
end
