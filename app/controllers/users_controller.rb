class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.search(params[:term]).paginate(:page => params[:page], :per_page => 5).order('created_at ASC')
  end

  # GET /users/1
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :term,
        :email,
        :password,
        :password_confirmation,
        :name,
        :phone,
        :address,
        :role_id
      )
    end

    def needs_password?(_user, params)
      params[:password].present?
    end
end
