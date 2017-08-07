require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki", body: "This is the content of the wiki", private: false) }

  describe "attributes" do
    it "has title, body and privacy attributes" do
      expect(wiki).to have_attributes(title: "New Wiki", body: "This is the content of the wiki", private: false)
    end
  end
end
