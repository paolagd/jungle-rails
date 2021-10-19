require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    User.new({
      first_name:  'Paola',
      last_name:  'Garcia',
      email: 'pacri@gmail.com',
      password: "this_is_a_pw_that_has_more_than_16_chars", 
      password_confirmation: "this_is_a_pw_that_has_more_than_16_chars" 
    })
  }

  describe 'Validations' do

    it "is valid with valid email, first name, last name, password and password_confirmation" do
      expect(subject).to be_valid
    end 

    it "is not valid if password and password_confirmation differ" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid 
    end 

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid 
    end 

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end 

    it "is not valid without an password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end 

    it "is not valid without an password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end 

    it "is not valid if the password length is less than 15 chars when a user account is being created" do
      subject.password = "pass"
      expect(subject).to_not be_valid      
    end 

    it "is not valid if the email is not unique" do  
  
      user1 = User.new({
        first_name:  'Paola2',
        last_name:  'Garcia2',
        email: 'pacri@g2mail.com',
        password: "this_is_a_pw_that_has_more_than_16_chars2", 
        password_confirmation: "this_is_a_pw_that_has_more_than_16_chars2" 
      })  
      user1.save
      user2 = User.new({
        first_name:  'Paola2',
        last_name:  'Garcia2',
        email: 'PACRI@G2MAIL.COM',
        password: "this_is_a_pw_that_has_more_than_16_chars2", 
        password_confirmation: "this_is_a_pw_that_has_more_than_16_chars2" 
      })  
      user2.save
      
      expect(user2).to_not be_valid      
    end  

  end

  describe '.authenticate_with_credentials' do
    context "with email with spaces" do
      it "still allows to log in" do
        # ...
      end
    end
  end

end
