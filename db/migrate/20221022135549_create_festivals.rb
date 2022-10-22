class CreateFestivals < ActiveRecord::Migration[7.0]
  def change
    create_table :festivals do |t|
      t.string :name
      t.references :shrine, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
