class CreateComparisons < ActiveRecord::Migration[5.1]
  def change
    create_table :comparisons do |t|
      t.string :company
      t.string :textFile
      t.string :csvFile
      t.string :downloadUrl

      t.timestamps
    end
  end
end
