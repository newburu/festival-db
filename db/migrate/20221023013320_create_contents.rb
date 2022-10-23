class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :kind
      t.string :url
      t.text :detail

      t.timestamps
    end
  end
end