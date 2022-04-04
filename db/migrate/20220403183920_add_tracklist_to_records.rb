class AddTracklistToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :tracklist, :text, array: true, default: []
  end
end
