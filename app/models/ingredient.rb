# == Schema Information
#
# Table name: ingredients
#
#  id   :integer          not null, primary key
#  name :string
#

class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :recipe
end
