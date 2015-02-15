class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #If you want to do some action before destroy
  #be#fore_destroy :some_method
  #Same, but before restore
  #before_restore :callback_name_goes_here

  layout 'bootstrap'
  # GET /users
  # GET /users.json
  def index
    @users = User.all.includes(:orders)
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to @user }
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
      flash[:success] = 'User was successfully destroyed.'
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def restore
    respond_to do |format|
      if User.with_deleted.find(params[:id]).restore(:recursive => true)
        flash[:success] = "User restored successfully" 
        format.html { redirect_to users_url }
      else
        flash[:danger] = "There was a problem restoring the User" 
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end  
    end
  end

  def reallyDestroy
    User.with_deleted.find(params[:id]).really_destroy!
    respond_to do |format|
      flash[:success] = "User realy destroyed successfully" 
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role)
    end
  end