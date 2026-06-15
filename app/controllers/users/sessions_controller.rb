class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.find_by(email: "guest@example.com")
    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました"
  end
end