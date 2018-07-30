require_relative '../application'

module Team
  class Session < Application
    def logout
      set_session(nil)

      exit!
    end
  end
end
