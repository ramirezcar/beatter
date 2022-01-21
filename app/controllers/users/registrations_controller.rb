# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /users/new
  def new
    @user = User.new
    @user.profile.build
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :encrypted_password, :aka, :desc, :avatar)
  end

  # GET /resource/sign_up
  def new
    super
  end

  # POST /profile
  def create
    @user = User.new(params)


    # mini_image = MiniMagick::Image.new(avatar)
    # @user.avatar = mini_image.resize '500x500'


    # respond_to do |format|
    # end
    
    # GET /resource/edit
    # def edit
    #   super
    #   respond_to do |format|
    #   end
    # end
  end
  
  # # PUT /resource
  # def update
  #   super
  #   redirect_to profile_path(params[:user.id]), notice: t('.success')
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  #   puts resource
  #   puts "-----------------------------------------------------------------------------------"
  # end

  def after_update_path_for(resource)
    user_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
