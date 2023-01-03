class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user
  before_action :authenticate_user!
  before_action :initialize_session
  before_action :load_cart

  private

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end

  def load_cart
    # @cart = Product.find(session[:cart])
    # Product.all.pluck(:id) => 1, 2
    # Product.find(1, 2, 3) => error
    # Product.where(id: [1, 2, 3]) => 1, 2
    @cart = Product.where(id: session[:cart])
  end
  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to root_path
  end
  
  def logged_in?
    !current_user.nil?
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pfp])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[pfp room_id])
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end