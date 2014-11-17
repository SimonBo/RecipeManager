class Item < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :user

  attr_accessor :name

  before_create :set_ingredient_or_create
  before_destroy :delete_users_related_recommendations

  private

  def set_ingredient_or_create
    if self.name and self.ingredient_id.nil?
      ingredient = Ingredient.find_or_create_by(name: self.name.downcase)
      self.ingredient_id = ingredient.id
    end
  end

  def delete_users_related_recommendations
    Recommendation.where("user_id = ?", self.user_id).delete_all if self.user_id
  end
end
