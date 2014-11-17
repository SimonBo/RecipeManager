class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :items
  has_many :ingredients, :through => :items
  has_many :meals
  has_many :recommendations

  def fetch_pantry_item_amount(item)
    return 0 unless self.items.pluck(:ingredient_id).include? item.ingredient.id
    self.items.pluck(:ingredient_id, :amount).select{|i| i[0] == item.ingredient.id}[0][1]
  end

  def has_item?(item)
    self.items.pluck(:ingredient_id).include? item.ingredient.id
  end
end
