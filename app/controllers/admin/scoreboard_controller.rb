require_relative "application_controller"
require_relative "../../models/play"
require_relative "../../models/score"
require_relative "../../models/freeze"

module Admin
  class ScoreboardController < ApplicationController
    def index
      play = Play.first 

      return freeze unless Freeze.all.empty?

      loop do
        system("clear")

        if Time.now >= play.end_time - 1.hours
          set_freeze

          break
        end

        @resources = Score.includes(:user).all.order(total_score: :desc)

        render("admin/scoreboard/index")

        sleep 1
      end
    end

    def freeze
      return puts "Freeze is already empty" if Freeze.all.empty?

      loop do
        system("clear")

        @resources = Freeze.includes(:user).all.order(total_score: :desc)

        render("admin/scoreboard/index")
        
        sleep 1
      end
    end

    def set_freeze
      Freeze.delete_all unless Freeze.all.empty?

      @resources = Score.includes(:user).all.order(total_score: :desc)

      @resources.each do |score|

        data = {
          total_score: score.total_score,
          user_id: score.user.id
        }

        Freeze.create(data)
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
