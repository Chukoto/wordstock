class CreateContentsHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :contents_histories do |t|

      t.timestamps
    end
  end
end
