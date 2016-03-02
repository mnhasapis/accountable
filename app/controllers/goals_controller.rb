class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @users = User.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @comment = Comment.new
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  def start_time
    @goal.start # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  # POST /goals
  # POST /goals.json
  def create


    @goal = current_user.goals.build(goal_params)
        if @goal.save
            redirect_to root_path
        end
    # @goal = Goal.new(goal_params)

    # respond_to do |format|
    #   if @goal.save
    #     format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
    #     format.json { render :show, status: :created, location: @goal }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @goal.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    def complete
      @goal = Goal.find(params[:id])
      @goal.update_attribute(:completed_at, Time.now)
      redirect_to root_path
    end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal
    @goal = Goal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def goal_params


    params.require(:goal).permit(:name, :description, :user_id, :avatar, :start_time)

  end
end
