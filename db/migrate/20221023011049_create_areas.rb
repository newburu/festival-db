class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.references :shrine, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :crest
      t.string :color
      t.text :content

      t.timestamps
    end
  end
end
