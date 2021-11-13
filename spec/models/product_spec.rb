require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "creates a product" do
      @category = Category.new(:name => "Sports")
      @product = Product.new(:name => "Tennis Ball", :price => 123, :quantity => 10, :category => @category)

      @product.save!
      expect(@product.id).to be_present
    end

    it "must have a name" do
      @category = Category.new(:name => "Sports")
      @product = Product.new(:name => nil, :price => 123, :quantity => 10, :category => @category.id)

      expect(@product.name).to be_nil
      expect(@product).to_not be_valid
    end

    it "must have a price" do
      @category = Category.new(:name => "Sports")
      @product = Product.new(:name => "Tennis Ball", :price => nil, :quantity => 10, :category => @category.id)

      expect(@product.price).to be_nil
      expect(@product).to_not be_valid
    end

    it "must have a quantity" do
      @category = Category.new(:name => "Sports")
      @product = Product.new(:name => "Tennis Ball", :price => 123, :quantity => nil, :category => @category.id)

      expect(@product.quantity).to be_nil
      expect(@product).to_not be_valid
    end

    it "must have a category" do
      @category = Category.new(:name => "Sports")
      @product = Product.new(:name => "Tennis Ball", :price => 123, :quantity => "10", :category => nil)

      expect(@product.category).to be_nil
      expect(@product).to_not be_valid
    end
   
   
  end
end