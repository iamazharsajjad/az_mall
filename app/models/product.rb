# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  price       :float
#  currency    :string
#  vendor_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :vendor

  validates :vendor_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :currency, presence: true

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :orderables
  has_many :carts, through: :orderables
end
