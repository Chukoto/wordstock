class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.integer :part_id, null: false
      t.string  :word, null: false
      t.timestamps
    end
  end
end
