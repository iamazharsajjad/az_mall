# frozen_string_literal: true

# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  product_id  :bigint           not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, presence: true
  validates :category, presence: true
end
