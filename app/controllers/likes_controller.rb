# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def create
    entry = Entry.find(params[:entry_id])
    current_or_guest_user.likes.create(entry: entry)
    redirect_to entry
  end

  def destroy
    entry = Entry.find(params[:entry_id])
    like = current_or_guest_user.likes.find_by(entry: entry)
    like&.destroy
    redirect_to entry
  end

  private

  def current_or_guest_user
    current_user || User.find_by(email: "guest@example.com")
  end
end