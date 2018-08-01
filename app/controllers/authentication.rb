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

  # def check_password(user, params)
  #   BCrypt::Password.new(user.password) == params[:password]
  # end
end
