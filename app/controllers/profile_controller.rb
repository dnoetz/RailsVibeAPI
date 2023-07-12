class ProfileController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        if current_user.id == @user.id
            render json: @user.as_json(only: [:id, :name, :email])
        else
            render json: { error: 'Unauthorized' }
        end
    end
end
