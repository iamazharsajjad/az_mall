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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'Validation Text' do
    before do
      @product = FactoryBot.build(:product)
    end

    it 'must have a vendor' do
      @product.vendor = nil
      product = @product.save

      expect(product).to eq(false)
    end

    it 'Should save successfully' do
      product = @product.save

      expect(product).to eq(true)
    end
  end
end
