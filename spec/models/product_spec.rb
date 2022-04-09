# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  context "create" do

    it 'should success' do
      product  = Product.create(description: "Banana")

      expect(product.description).to eq("Banana")
    end

  end


end
