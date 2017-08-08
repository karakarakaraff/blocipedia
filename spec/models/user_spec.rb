require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {  create(:user) }

  describe "attributes" do
    it "should have username and email attributes" do
      expect(user).to have_attributes(username: user.username, email: user.email)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_username) { User.new(username: "", email: "user@username.com") }
    let(:user_with_invalid_email) { User.new(username: "username123", email: "") }

    it "should be an invalid user due to blank username" do
      expect(user_with_invalid_username).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
   end

end
