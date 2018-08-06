require_relative 'application_controller'

module Admin
  class SessionController < ApplicationController
    def logout
      set_session(nil)

      exit!
    end
  end
end
