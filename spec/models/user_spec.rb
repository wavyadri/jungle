require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    subject do
      described_class.new(
        first_name:            "Test",
        last_name:             "User",
        email:                 "test@test.com",
        password:              "secret",
        password_confirmation: "secret"
      )
    end
    
    it "must be created with a password and password_confirmation fields" do
      @password =
      @password_confirmation = 
    end 
  end
end
