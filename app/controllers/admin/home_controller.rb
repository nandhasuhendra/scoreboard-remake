require_relative 'application_controller'
require_relative 'flag_controller'
require_relative 'play_controller'
require_relative 'team_controller'
require_relative 'session_controller'
require_relative 'category_controller'
require_relative 'challenge_controller'
require_relative 'passphrase_controller'
require_relative 'submission_controller'
require_relative 'scoreboard_controller'

module Admin
  class HomeController < ApplicationController
    def initialize
      @allowed_command = %w(
      info
      submit
      passphrase
      submissions
      set-playtime
      set-reduction

      score
      score/freeze
      score/unfreeze
      
      flag
      flag/new
      flag/update
      flag/delete
      flag/batch-flag
      flag/auto-generate
      flag/import

      challenge
      challenge/new
      challenge/update
      challenge/delete

      category
      category/new
      category/update
      category/delete

      team
      team/register
      team/update
      team/delete
      team/batch-register
      team/import
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
