class AddOnsaleToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :onsale, :boolean
  end
end
