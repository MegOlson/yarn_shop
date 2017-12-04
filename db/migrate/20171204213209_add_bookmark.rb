class AddBookmark < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :bookmarked, :boolean, default: false
  end
end
