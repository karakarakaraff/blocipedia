class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wikis = WikiPolicy::Scope.new(current_user, Wiki).resolve
  end

  def show
    @wiki = Wiki.find(params[:id])
    if @wiki.private?
      if @wiki.user == current_user
        wiki_path
      elsif current_user.standard?
        flash[:alert] = "You must be a premium user to view private wikis."
        redirect_to new_charge_path
      elsif @wiki.collaborators.exclude?(current_user)
        flash[:alert] = "You must be a collaborator to view that wiki."
        redirect_to wikis_path
      end
    else
      wiki_path
    end
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
