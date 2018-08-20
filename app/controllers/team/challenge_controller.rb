require_relative 'application_controller'
require_relative "../../models/play"
require_relative '../../models/challenge'
require_relative '../../helpers/application'

module Team
  class ChallengeController < ApplicationController
    def index
      play = Play.first

      return puts "Challenge will be open at %s" % [play.start_time] if Time.now <= play.start_time

      @resources = Challenge.all

      render("team/challenge/index")
    end
  end
end
