require_relative 'application_controller'
require_relative 'flag_controller'
require_relative 'team_controller'
require_relative 'session_controller'
require_relative 'category_controller'
require_relative 'challenge_controller'
require_relative 'scoreboard_controller'

module Admin
  class HomeController < ApplicationController
    def initialize
      @allowed_command = %w(
      challenge
      scoreboard
      flag

      category
      category/new
      category/update
      category/delete

      team
      team/register
      team/update
      team/delete
      team/batch-register
      )
      @command_completion = @allowed_command
    end

    def menu
      while line = readline
        # Libs::Routing.params({})
        Libs::Routing.dispatch(line, 'admin')
      end
    end
  end
end
