require 'spec_helper'

describe Writer do

  before { @writer = Writer.new(first_name: "Example", last_name: "Writer", email: "writer@example.com",
  															password: "password", password_confirmation: "password", gender: "male",
  															screen_name: "sample screen") }

  subject { @writer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:gender) }
  it { should respond_to(:screen_name) }

  it { should be_valid }

  describe "when first and last name is not present" do
    before do
    	@writer.first_name = " "
    	@writer.last_name = " "
    end
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @writer.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      emails = %w[writer@example,com writer_at_example.org example.writer@example.
                     foo@bar_baz.com foo@bar+baz.com]
      emails.each do |invalid_email|
        @writer.email = invalid_email
        @writer.should_not be_valid
      end      
    end
  end

  # describe "when email format is valid" do
  #   it "should be valid" do
  #     addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  #     addresses.each do |valid_address|
  #       @writer.email = valid_address
  #       @writer.should be_valid
  #     end      
  #   end
  # end

  describe "when email is already taken" do
    before do
      writer_with_same_email = @writer.dup
      writer_with_same_email.email = @writer.email.upcase
      writer_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is absent" do
	  before { @writer.password = @writer.password_confirmation = " " }
	  it { should_not be_valid }
	end

	describe "when gender is male or female" do
		before { @writer.gender = "male" }
		it { should be_valid }

		before { @writer.gender = "female" }
		it { should be_valid }
	end

	describe "when screen name is absent" do
		before { @writer.screen_name = " " }
		it { should_not be_valid }
	end

	 describe "when password doesn't match confirmation" do
    before { @writer.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @writer.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a short password" do
    before { @writer.password = @writer.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end