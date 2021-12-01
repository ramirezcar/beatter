class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :current_cart
    before_action :notifications

    protected

    def configure_permitted_parameters
        attributes = [:aka, :desc, :avatar, :email, :password, :password_confirmation]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
      end

      def notifications
        @notifications = Notification.where(recipient_id: current_user).unread
      end

    def index
        if current_user
            @user = current_user
        else
            redirect_to new_user_session_path
        end
    end

    private
    def current_cart
        if session[:cart_id]
            cart = Cart.find_by(id: session[:cart_id])
            if cart.present?
                @current_cart = cart
            else
                session[:cart_id] = nil
            end
        end

        if session[:cart_id] == nil
            @current_cart = Cart.create
            session[:cart_id] = @current_cart.id
        end
    end

end
