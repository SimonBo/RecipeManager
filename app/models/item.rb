class Item < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :user

  attr_accessor :name

  after_create :set_ingredient_or_create

  private

  def set_ingredient_or_create
    if self.name
      self.ingredient_id = Ingredient.find_or_create_by(name: self.name.downcase).id
    end
    self.save
  end
end
