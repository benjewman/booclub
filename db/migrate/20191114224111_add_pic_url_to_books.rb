class AddPicUrlToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :pic_url, :string
  end
end
