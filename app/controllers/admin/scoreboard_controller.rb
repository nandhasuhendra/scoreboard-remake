require_relative "application_controller"
require_relative "../../models/score"
require_relative "../../models/freeze"

module Admin
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

    def freeze
      print "Freeze the scoreboard(Y/n): "
      freeze = gets.chomp.upcase

      if freeze.eql? "Y"
        Freeze.delete_all unless Freeze.all.empty?

        @resources = Score.includes(:user).all.order(total_score: :desc)

        @resources.each do |score|
          Freeze.create(
            total_score: score.total_score,
            user_id: score.user.id,
          )
        end
      end
    end

    def unfreeze
      print "UnFreeze the scoreboard(Y/n): "
      freeze = gets.chomp.upcase

      if freeze.eql? "Y"
        Freeze.delete_all unless Freeze.all.empty?
      end
    end
  end
end
