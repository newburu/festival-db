class CreateContentHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :content_hashtags do |t|
      t.references :content, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
