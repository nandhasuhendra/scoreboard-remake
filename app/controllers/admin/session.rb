require_relative 'application'

module Admin
  class Session < Application
    def logout
      set_session(nil)

      exit!
    end
  end
end
