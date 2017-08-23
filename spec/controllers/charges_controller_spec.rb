require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:my_user) { create(:user) }

  before do
    my_user.confirm
    sign_in my_user
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
