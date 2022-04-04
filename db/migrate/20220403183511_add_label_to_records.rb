class AddLabelToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :label, :string
    add_column :records, :masterid, :string
  end
end
