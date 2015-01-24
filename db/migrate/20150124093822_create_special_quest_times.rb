class CreateSpecialQuestTimes < ActiveRecord::Migration
  def change
    create_table :special_quest_times do |t|
      t.string :date, limit: 10
      t.text :time_table
      t.string :tweet_url, limit: 128
      t.timestamps null: false
    end
    add_index :special_quest_times, :date, unique: true
  end
end
