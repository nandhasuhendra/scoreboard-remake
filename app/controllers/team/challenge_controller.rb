require_relative 'application_controller'
require_relative '../../models/challenge'
require_relative '../../helpers/application'

module Team
  class ChallengeController < ApplicationController
    def index
      @resources = Challenge.all

      render("team/challenge/index")
    end
  end
end
