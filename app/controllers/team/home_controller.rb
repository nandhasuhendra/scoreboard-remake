require_relative '../application_controller'
require_relative 'flag_controller'
require_relative 'session_controller'
require_relative 'challenge_controller'
require_relative 'scoreboard_controller'

module Team
  class HomeController < ApplicationController
    def initialize
      @allowed_command = %w(challenge scoreboard flag)
      @command_completion = @allowed_command
    end

    def menu
      while line = readline
        Libs::Routing.params({})
        Libs::Routing.dispatch(line, 'team')
      end
    end
  end
end
