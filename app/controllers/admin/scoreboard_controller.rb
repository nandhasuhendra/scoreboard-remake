require_relative "application_controller"
require_relative "../../models/score"

module Admin
  class ScoreboardController < ApplicationController
    def index
      @resources = Score.includes(:user).all.order(total_score: :desc)

      render("admin/scoreboard/index")
    end
  end
end
