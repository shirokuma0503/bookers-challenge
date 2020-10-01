class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    #新規登録後マイページへとぶ
    def after_sign_up_path_for(resource)
        user_path(resource)
    end
    #ログイン後マイページへとぶ
    def after_sign_in_path_for(resource)
        user_path(resource)
    end
    #ログアウト後トップページへとぶ
    def after_sign_out_path_for(resource)
        root_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

end
