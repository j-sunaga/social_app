class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # ログインチェック
  before_action :login_required

  private

  def login_required
    unless current_user then
      flash[:notice] = 'ログインが必要です。'
       redirect_to new_session_path unless current_user
    end
  end
end
