class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  def index; end
end
