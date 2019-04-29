class UsersController < ApplicationController
  def edit_multiple
    if params[:commit] == "Delete"
      User.where(id: params[:users_id]).destroy_all
    elsif params[:commit] == "Lock"
      User.where(id: params[:users_id]).each do |user_to_lock|
        user_to_lock.lock_access!
      end
    elsif params[:commit] == "Unlock"
      User.where(id: params[:users_id]).each do |user_to_unlock|
        user_to_unlock.unlock_access!
      end
    elsif params[:commit] == "Admin"
      User.where(id: params[:users_id]).each do |user_to_admin|
        user_to_admin.admin=true
        user_to_admin.save
      end
    end
   redirect_back(fallback_location: root_path)
  end	
end
