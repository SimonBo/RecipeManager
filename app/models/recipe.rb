class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
  has_many :ingredients, :through => :items

  def self.find_recommendations(user)
    recommendations = []
    pantry = user.items
    pantry_items = pantry.pluck(:ingredient_id)
    Recipe.all.each do |recipe|
      if recipe.compare_ingredients(user)
        recommendations << recipe
      end
    end
    recommendations
  end

  def compare_ingredients(user)
    self.items.each do |item|
      return false if !user.has_item?(item) or user.fetch_pantry_item_amount(item) < item.amount
    end
    return true
  end

end
