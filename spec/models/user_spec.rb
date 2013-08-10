# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

	before(:each) do
	  @attr = {:name => "Example User", :email => "user@example.com"}
	end

  #validating the creation of new instances of a user
  it "should create a new instance given a valid attribute" do
  	User.create!(@attr)
  end

  #validating the presence of a name
  it "should require a name" do
  	no_name_user = User.new(@attr.merge(:name => ""))
  	no_name_user.should_not be_valid
  end

  #validating the presence of an email address
  it "should have an email address" do
  	no_email_user = User.create!(@attr.merge(:email => ""))
  	no_email_user.should_not be_valid
  end

  #validate the length of the name
  it "should reject names that are too long" do
		#maximum length is 50
		long_name = "a" * 51
		long_name_user = User.new(@attr.merge(:name => long_name))
		long_name_user.should_not be_valid
  end

  #validating the email address
  it "should accept a valid email address" do
  	addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  	addresses.each do |address|
  	valid_email_user = User.new(@attr.merge(:email => address))
  		valid_email_user.should be_valid
  	end
  end

  #more validation for email address
  it "should reject invalid email addresses" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |address|
				invalid_email_user = User.new(@attr.merge(:email => addresss))
				invalid_email_user.should_not be_valid
			end
  end

  #validation for duplicate email addresses
  it "Should reject duplicate email addresses" do
  	User.create!(@attr)
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end

  #more validation for duplicate addresses
  it "should reject email addresses identical up to case" do
  	upcased_email = @attr[:email].upcase
  	User.create!(@attr.merge(:email => upcased_email))
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end
end
