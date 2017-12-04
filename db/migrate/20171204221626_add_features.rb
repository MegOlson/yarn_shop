class AddFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :featured, :boolean, default: false
  end
end
