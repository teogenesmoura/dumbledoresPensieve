class CreateMemoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_items do |t|
      t.string :content
      t.string :location
      t.string :weather
      t.datetime :date_recorded
      t.references :memory_list, foreign_key: true

      t.timestamps
    end
  end
end
