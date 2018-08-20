require_relative "application_controller"
require_relative "admin/home_controller"
require_relative "team/home_controller"
require_relative "../models/user"

class AuthenticationController < ApplicationController
  def login
    puts File.read(Dir.pwd + '/banner.txt')

    params = {}

    print 'Username : '
    params[:username] = gets.chomp

    print 'Password : '
    params[:password] = gets.chomp

    user = User.find_by_username(params[:username])

    if user and user.authenticate(params[:password])
      set_session(user)

      # Libs::Routing.params({})
      Libs::Routing.dispatch('home', ((user.is_admin) ? 'admin' : 'team'))
    else
      puts 'Failed'

      sleep 2

      # Libs::Routing.params({})
      Libs::Routing.dispatch('login')
    end
  end
end
