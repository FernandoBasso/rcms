class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  # Sets the locale according to parameters, otherwise uses the default one.
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Necessary so that url/path helpers work properly with locales.
  def default_url_options
    { locale: I18n.locale }
  end
end
