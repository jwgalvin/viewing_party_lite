class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.date :date
      t.time :start
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
