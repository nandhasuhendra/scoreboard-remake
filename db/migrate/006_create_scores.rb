class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.bigint     :total_score, default: 0
      t.references :user,       foreign_key: true

      t.timestamps
    end
  end
end
