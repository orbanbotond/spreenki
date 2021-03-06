module Admin
  module Enki
    class BaseController < ApplicationController
      layout 'admin_enki'

      helper 'admin/navigation_enki'

      before_filter :require_login

      protected

      def require_login
        return redirect_to(admin_session_path) unless session[:logged_in]
      end

      def set_content_type
        headers['Content-Type'] ||= 'text/html; charset=utf-8'
      end
    end
  end
end
