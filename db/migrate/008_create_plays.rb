class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.integer   :reduction
      t.datetime  :start_time
      t.datetime  :end_time

      t.timestamps
    end
  end
end
