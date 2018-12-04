class ChangeFloatToIntegerInPrices < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prices, :integer
  end
end
