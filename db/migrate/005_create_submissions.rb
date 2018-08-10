class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.text        :submission
      t.boolean     :is_correct, default: false
      t.references  :owner
      t.references  :submiter
      t.references  :challenge

      t.timestamps
    end
  end
end
