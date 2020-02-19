class AddPriceToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :price, :float
  end
end
