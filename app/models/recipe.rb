class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
  has_many :ingredients, :through => :items
end
