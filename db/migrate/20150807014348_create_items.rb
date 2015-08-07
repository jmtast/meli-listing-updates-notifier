class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :meli_id
      t.string  :title
      t.integer :price
      t.date    :stop_time
      t.string  :permalink
    end
  end
end
