require 'spec_helper'

describe "SessionPages" do

	subject { page }

	describe "sign in page" do
		before { visit admin_signin_path }

		it { should have_selector('h1', text: 'Sign in') }
	end

	describe "signin" do
    before { visit admin_signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('h1', text: 'Sign in') }
      it { should have_selector('p', text: 'Invalid') }
    end

    describe "with valid information" do
    let(:writer) { FactoryGirl.create(:writer) }
    before do
      fill_in "Email",    with: writer.email
      fill_in "Password", with: writer.password
      click_button "Sign in"
    end

    it { should have_selector('h1', text: writer.first_name) }
    it { should have_link('Profile', href: writer_path(writer)) }
    it { should have_link('Sign out', href: signout_path) }
    it { should_not have_link('Sign in', href: admin_signin_path) }
  end
  end
end
