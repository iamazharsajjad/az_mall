# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :vendor

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
end
