class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :items
  has_many :ingredients, :through => :items
  has_many :meals
end
