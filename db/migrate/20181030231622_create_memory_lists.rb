class CreateMemoryLists < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_lists do |t|
      t.string :title
      t.text :description
      t.datetime :date_created

      t.timestamps
    end
  end
end
