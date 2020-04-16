class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    created_user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)

    redirect_to "/"
  end

  def login
    check_email = params[:email]
    check_password = params[:password]
    if (User.where(["email = ? and password = ?", check_email, check_password]).exists?)
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
