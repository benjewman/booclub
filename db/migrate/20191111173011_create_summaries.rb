class CreateSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :summaries do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
