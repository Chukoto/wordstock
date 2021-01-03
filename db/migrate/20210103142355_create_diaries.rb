class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|

      t.timestamps
    end
  end
end
