class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.string :year
      t.string :image
      t.string :comment
      t.string :label
      t.string :masterid

      t.timestamps
    end
  end
end
