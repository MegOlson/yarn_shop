class AddSale < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :on_sale, :boolean, default: false
  end
end
