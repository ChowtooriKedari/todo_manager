class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:id).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end
end
