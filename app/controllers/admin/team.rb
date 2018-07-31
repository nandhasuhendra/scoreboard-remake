require_relative 'application'
require_relative '../../models/user'

module Admin
  class Team < Application
    def index
      @user = User.all

      render("team/index.erb")
    end

    def create
      @time = Time.now
      render("team/create.erb")
    end

    def edit
      puts "edit user"
    end

    def delete
      puts "delete user"
    end
  end
end
