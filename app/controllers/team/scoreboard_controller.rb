require_relative "application_controller"
require_relative "../../models/score"

module Team
  class ScoreboardController < ApplicationController
    def index
      unless Freeze.all.empty?
        @resources = Freeze.includes(:user).all.order(total_score: :desc)

        render("admin/scoreboard/index")
      else
        loop do
          system("clear")

          @resources = Score.includes(:user).all.order(total_score: :desc)

          render("admin/scoreboard/index")

          sleep 1
        end
      end
    end
  end
end
