class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where(username: params[:username]).take

    if @user == nil
      flash[:error] = "That user could not be found."
      redirect_to edit_wiki_path(@wiki)
    else
      collaborator = @wiki.collaborators.build(user_id: @user.id)
      if collaborator.save
        flash[:notice] = "#{@user.username} has been added to the wiki."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:error] = "That user could not be added. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki
    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.username} removed as collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "#{@collaborator.user.username} could not be removed."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
