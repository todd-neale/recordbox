class AddRecordToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_reference :boxes, :record, foreign_key: true
  end
end
