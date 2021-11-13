require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is a valid user" do
      @user = User.new(:first_name => "Adri", :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save
      expect(@user).to be_valid
    end

    it  "is invalid without a first name" do
      @user = User.new(:first_name => nil, :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without a last name" do
      @user = User.new(:first_name => "adri", :last_name => nil, :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without a password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => nil, :password_confirmation => "123456789")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without a confirmation password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => nil)
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without matching password and password confirmation" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "1234567890", :password_confirmation => "123456789")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without password length greater than 6" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "12", :password_confirmation => "12")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid without an email" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => nil, :password => "123456789", :password_confirmation => "123456789")
      @user.save
      expect(@user).to_not be_valid
    end

    it  "is invalid if same email already exists" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user2 = User.new(:first_name => 'Adriana', :last_name => "Banana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")

      @user.save
      @user2.save
      expect(@user2).to_not be_valid
    end

    it  "is invalid if same email but with different casing already exists" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "Adriana@gmail.COM", :password => "123456789", :password_confirmation => "123456789")
      @user2 = User.new(:first_name => 'Adriana', :last_name => "Banana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")

      @user.save
      @user2.save
      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "return user with valid email and valid password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save

      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
      expect(@user.email).to eq('adriana@gmail.com')
    end

    it "return nil with no provided email and password" do
      expect(User.authenticate_with_credentials(nil, nil)).to eq(nil)
    end

    it "return nil with invalid email and nil password" do
      expect(User.authenticate_with_credentials("example@gamil.com", nil)).to eq(nil)
    end

    it "return nil with valid email and invalid password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save

      expect(User.authenticate_with_credentials(@user.email, '1')).to eq(nil)
    end

    it "return user with valid email with leading white space and valid password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save

      expect(User.authenticate_with_credentials('   adriana@gmail.com', @user.password)).to eq(@user)
    end

    it "return user with valid email in a different case than the sign up email and valid password" do
      @user = User.new(:first_name => 'Adri', :last_name => "Ana", :email => "Adriana@gmail.com", :password => "123456789", :password_confirmation => "123456789")
      @user.save

      expect(User.authenticate_with_credentials('ADRIANA@Gmail.Com', @user.password)).to eq(@user)
    end
  end

end
