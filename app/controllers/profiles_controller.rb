class ProfilesController < ApplicationController

  def show
    # This sets @user to a user based on their id
    @user = User.find(params[:id])

  end

  def feed
    @goals = Goal.where(user_id: current_user.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
    @goal = Goal.new
    # @complete = Goal.where(:completed_at != nil)
  end

    def complete
      @goal = Goal.find(params[:id])
      @goal.update_attribute(:completed_at, Time.now)
      redirect_to feed_path
    end

  def index
    # This sets @users to every User in our database
    @users = User.all
  end
end
