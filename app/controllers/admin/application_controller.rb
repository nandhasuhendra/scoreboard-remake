require_relative '../application_controller'
require_relative '../../models/user'

module Admin
  class ApplicationController < ApplicationController
    def initialize
      is_not_admin?
    end

    protected
      def is_not_admin?
        unless @@sessions.is_admin?
          Libs::Routing.params({})
          Libs::Routing.dispatch('logout')
        end
      end
  end
end
