require_relative '../../config/route'

module Libs
  class Routing
    include Config

    # def self.params(params = {})
    #   @params = params
    # end

    def self.dispatch(to, group = '')
      begin
        to = to.strip.downcase

        return '' if to.empty?

        route = ROUTES[to]
        route = get_route(route, group)

        kelas = "#{route[:class]}".constantize
        kelas = kelas.send(:new)
        # kelas.send(:set_params, @params)
        kelas.send(route[:method])
      rescue Exception => e
        puts 'Route not found : %s' % [to]
      end
    end

    protected
      def self.get_route(to, group = '')
        route = to.split('#')

        route = {
          class: (group != '') ? '%s::%s' % [group.capitalize, route.first] : '%s' % [route.first],
          method: route.last
        }
      end
  end
end
