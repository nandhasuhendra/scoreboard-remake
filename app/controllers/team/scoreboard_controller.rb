require_relative "application_controller"
require_relative "../../models/score"

module Team
  class ScoreboardController < ApplicationController
    def index
      unless Freeze.all.empty?
        @resources = Freeze.includes(:user).all.order(total_score: :desc)

        render("admin/scoreboard/index")
      else
        @resources = Score.includes(:user).all.order(total_score: :desc)

        render("admin/scoreboard/index")
      end
    end
  end
end
