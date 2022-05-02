class Tweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :content_picture, :string
  end
end
