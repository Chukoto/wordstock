class CreateContentsHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :contents_histories do |t|
      t.string :word, null: false
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.timestamps
    end
  end
end
