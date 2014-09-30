class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SiteAccessCountFilter
  include TrackingCookieFilter
  before_action :site_access_count
  after_action  :tracking_cookie

end
