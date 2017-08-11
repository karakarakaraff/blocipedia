class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.all
    @user = current_user
  end
end
