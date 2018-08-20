require_relative 'application_controller'
require_relative 'team_controller'
require_relative 'session_controller'
require_relative 'challenge_controller'
require_relative 'passphrase_controller'
require_relative 'submission_controller'
require_relative 'scoreboard_controller'

module Team
  class HomeController < ApplicationController
    def initialize
      @allowed_command = %w(
      submit
      score
      passphrase
      challenge
      team
      )
      @command_completion = @allowed_command
    end

    def menu
      while line = readline
        # Libs::Routing.params({})
        Libs::Routing.dispatch(line, 'team')
      end
    end
  end
end
