class CreateContentFestivals < ActiveRecord::Migration[7.0]
  def change
    create_table :content_festivals do |t|
      t.references :content, null: false, foreign_key: true
      t.references :festival, null: false, foreign_key: true

      t.timestamps
    end
  end
end
