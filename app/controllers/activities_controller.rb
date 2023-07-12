class ActivitiesController < ApplicationController
    before_action :authenticate_user!, only: [:addActivity, :removeActivity]

    def addActivity
        @activity = current_user.activities.build(activity_params)

        if @activity.save
            UserActivity.create(user: current_user, activity: @activity)

            render json: @activity
        else
            render json: { error: 'Unable to create activity.' }
        end
    end

    def index
        @activities = current_user.activities
        
        render json: @activities
    end

    # def show
    #     @activity = Activity.find(params[:id])

    #     render json: @activity
    # end

    def removeActivity
        @activity = current_user.activities.find(params[:id])

        user_activity = UserActivity.find_by(user: current_user, activity: @activity)
        if user_activity.present?
          user_activity.destroy
        end
      
        if @activity.destroy
          render json: { message: 'Activity removed.' }
        else
          render json: { error: 'Unable to remove activity.' }
        end
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :category, :location, :image)
    end

end
