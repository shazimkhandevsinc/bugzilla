class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:user_type ,:profile)
  end

  def account_update_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :user_type,:current_password ,:profile)
  end

end
