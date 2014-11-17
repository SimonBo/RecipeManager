class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
