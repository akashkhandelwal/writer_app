require 'spec_helper'

describe "Writer pages" do

  subject { page }

  describe "signup" do

    let(:writer) { FactoryGirl.create(:writer) }
    before { visit registration_path(writer.id, writer.invitation_token) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a writer" do
        expect { click_button submit }.not_to change(Writer, :count)
      end
    end
  end

  describe "signup page" do
    let(:writer) { FactoryGirl.create(:writer) }
    before { visit registration_path(writer.id, writer.invitation_token) }

    it { should have_selector('h1',    text: 'New writer') }
  end

  describe "profile page" do
	  let(:writer) { FactoryGirl.create(:writer) }
	  before { visit writer_path(writer) }

	  it { should have_selector('h1',    text: writer.first_name) }
	end
end