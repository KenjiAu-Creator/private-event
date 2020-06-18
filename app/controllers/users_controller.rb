class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, except: [:index, :show, :new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @upcoming_events = upcoming_attend_events
    @past_events = previous_attend_events
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    session[:user_id] = @user.id
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      #params.fetch(:user, {})
      params.require(:user).permit(:username)
    end

    def upcoming_attend_events
      # Pulls events from the Users attending model and then compares the date to the current date.
      current_date = Date.current
      upcoming_events = []
      current_user = User.find(params[:id])

      current_user.attended_events.each do |event|
        if event.date.to_date > current_date
          upcoming_events.push(event)
        end
      end
      return upcoming_events
    end
  
    def previous_attend_events
      # Pulls events from the Users attending model and then compares the date to the current date.
      current_date = Date.current
      current_user = User.find(params[:id])
      past_events = []
      
      current_user.attended_events.each do |event|
        if event.date.to_date < current_date
          past_events.push(event)
        end
      end
      return past_events
    end
end
