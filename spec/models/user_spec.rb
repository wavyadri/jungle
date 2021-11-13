require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is a valid user" do
      @user = User.new(:first_name => "Adri", :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      expect(@user).to be_valid
    end

    it  "is invalid without a first name" do
      @user = User.new(:first_name => nil, :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      expect(@user).to_not be_valid
    end

    it  "is invalid without a last name" do
      @user = User.new(:first_name => "adri", :last_name => nil, :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      expect(@user).to_not be_valid
    end

    it  "is invalid without an email" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => nil, :password => "123456789", :password_confirmation => "123456789")
      expect(@user).to_not be_valid
    end

    it  "is invalid without a password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => nil, :password_confirmation => "123456789")
      expect(@user).to_not be_valid
    end

    it  "is invalid without a confirmation password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => nil)
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
