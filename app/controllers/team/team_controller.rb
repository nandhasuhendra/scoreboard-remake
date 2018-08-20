require_relative 'application_controller'
require_relative '../../models/user'
require_relative '../../helpers/application'

module Team
  class TeamController < ApplicationController
    def info
      @resources = @@sessions
      render("team/team/info")
    end

    def index
      @resources = User.all

      render("team/team/index")
    end
  end
end
