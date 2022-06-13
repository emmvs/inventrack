class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type_of_item
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
