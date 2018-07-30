require_relative '../application'
require_relative 'flag'
require_relative 'session'
require_relative 'challenge'
require_relative 'scoreboard'

module Team
  class Home < Application
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
