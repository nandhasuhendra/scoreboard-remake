require_relative '../application'
require_relative 'flag'
require_relative 'team'
require_relative 'session'
require_relative 'challenge'
require_relative 'scoreboard'

module Admin
  class Home < Application
    def initialize
      @allowed_command = %w(challenge scoreboard flag team)
      @command_completion = @allowed_command
    end

    def menu
      while line = readline
        Libs::Routing.params({})
        Libs::Routing.dispatch(line, 'admin')
      end
    end
  end
end
