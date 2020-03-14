class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    created_user = User.create!(name: name, email: email, password: password)
    display_text = "New User is created with new ID value #{created_user.id}"
    render plain: display_text
  end

  def login
    check_value = 0
    check_email = params[:email]
    check_password = params[:password]
    User.find_each do |record|
      if ("#{record.email}" == check_email)
        if ("#{record.password}" == check_password)
          check_value = 1
        end
      end
    end
    if check_value == 1
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
