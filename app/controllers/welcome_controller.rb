class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.all
  end
end
