class Current::UsersController < ApplicationController
  class Current::UsersController < BaseController
    before_action :authenticate_user!
  
    def show
      render json: current_user, serializer: CurrentUserSerializer
    end
  end
end
