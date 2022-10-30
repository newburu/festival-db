class CreateContentAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :content_areas do |t|
      t.references :content, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
