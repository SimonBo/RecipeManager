class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.references :user, index: true
      t.decimal :amount, default: "1"
      t.string :measure, default: "piece"

      t.timestamps
    end
  end
end
