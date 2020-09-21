class HelpfulsController < ApplicationController
  def create
    @helpful = current_user.helpfuls.create(post_id: params[:post_id])
    redirect_to root_path
  end
  def destroy
    @helpful = Helpful.find_by(post_id: params[:post_id], user_id: current_user.id)
    @helpful.destroy
    redirect_to root_path
  end
end
