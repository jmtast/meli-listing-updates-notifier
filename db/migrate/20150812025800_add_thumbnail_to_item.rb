class AddThumbnailToItem < ActiveRecord::Migration
  def change
    add_column :items, :thumbnail, :string
  end
end
