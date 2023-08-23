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
FactoryBot.define do
  factory :product do
    title { 'My product' }
    description { 'This Is My product' }
    price { rand(1..100) }
    currency { '$' }
    vendor { FactoryBot.create(:vendor) }
  end
end
