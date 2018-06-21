class AddAttachmentDataToComparisons < ActiveRecord::Migration[5.1]
  def change
    add_column :comparisons, :attachment_data, :text
    add_column :comparisons, :attachment2_data, :text
  end
end
