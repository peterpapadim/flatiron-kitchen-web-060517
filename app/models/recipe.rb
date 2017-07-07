# == Schema Information
#
# Table name: recipes
#
#  id   :integer          not null, primary key
#  name :string
#

class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredients

  def ingredient_names
    self.ingredients.map do |i|
      i.name
    end
  end

  def ingredient_names=(arr)
    ingredients = arr.map do |ingredient_name|
      Ingredient.find_or_create_by(name: ingredient_name)
    end

    self.ingredients.clear

    ingredients.each do |ingredient|
      self.ingredients << ingredient
    end
  end

end
