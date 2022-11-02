class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb" })
  end

  def create
    input_username = params.fetch("input_username")
    new_user = User.new
    new_user.username = input_username
    new_user.save

    redirect_to("/users/" + new_user.username.to_s)
  end

  def update
    id = params.fetch("path_id")

    matching_usernames = User.where({ :id => id })

    the_user = matching_usernames.first
    input_username = params.fetch("input_username")

    the_user.username = input_username
    the_user.save
    redirect_to("/users/" + the_user.username.to_s)
  end
end
