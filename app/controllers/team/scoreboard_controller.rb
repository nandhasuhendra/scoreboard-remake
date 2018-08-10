require_relative "application_controller"
require_relative "../../models/score"

module Team
  class ScoreboardController < ApplicationController
    def index
      @resources = Score.includes(:user).all.order(total_score: :desc)

      render("team/scoreboard/index")
    end
  end
end
