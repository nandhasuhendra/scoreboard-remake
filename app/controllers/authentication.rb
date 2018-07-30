require_relative "application"
require_relative "admin/home"
require_relative "team/home"
require_relative "../models/user"

class Authentication < Application
  def login
    puts File.read(Dir.pwd + '/banner.txt')

    params = {}

    print 'Username : '
    params[:username] = gets.chomp

    print 'Password : '
    params[:password] = gets.chomp

    user = User.where(username: params[:username]).where(password: params[:password]).first
    
    if user
      set_session(params)

      Libs::Routing.params({})
      Libs::Routing.dispatch('home', is_admin?(user))
    else
      puts 'Failed'

      sleep 2

      Libs::Routing.params({})
      Libs::Routing.dispatch('login')
    end
  end
end
