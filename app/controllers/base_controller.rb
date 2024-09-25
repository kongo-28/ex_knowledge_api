class BaseController < ApplicationController
  alias_method :current_user, :current_user
  alias_method :authenticate_user!, :authenticate_user!
  alias_method :user_signed_in?, :user_signed_in?
end