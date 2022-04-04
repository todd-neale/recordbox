class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.string :year
      t.string :bpm
      t.string :key
      t.string :image
      t.string :comment

      t.timestamps
    end
  end
end
