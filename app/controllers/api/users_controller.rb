class Api::UsersController < Api::ApplicationController
  load_and_authorize_resource

  def show
    @user = {}
    @user = User.find_by(uuid: params[:id]) if params[:id]
    render json:  @user.to_json(except: [:id, :created_at, :updated_at, :generated_password])
  end

  def create
    @user = User.new(user_params)
    if u = User.find_by(email: @user.email)
      render json: u.to_json(
        except: [:id, :created_at, :updated_at, :generated_password])
    else
      if @user.save
        render json: @user.to_json(
          except: [:id, :created_at, :updated_at, :generated_password]),
          status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  private
    def user_params
      params.fetch(:user).permit(:email, :provider, social_data: {})
    end
end
