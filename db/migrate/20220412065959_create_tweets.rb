class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
