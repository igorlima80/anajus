class HomeController < Admin::ApplicationController
  def index
    if current_user.has_role? :admin
      redirect_to cities_path
    end
  end
end
