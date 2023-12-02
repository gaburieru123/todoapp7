class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller? #編集機能について

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

    #編集機能について
    def configure_account_update_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

  #新規登録・ログインした後のページへのパス
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
    #ログアウトした時のパスをログイン画面にするように設定。
  end
end
