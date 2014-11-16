class ChangeAmountToFloat < ActiveRecord::Migration
  def change
    change_column :items, :amount, :float
  end
end
