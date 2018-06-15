class UsersController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_path
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if update_resource(@user, user_params)
        format.html { redirect_to root_path, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to map_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :phone_number, :password, :password_confirmation, :email)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end