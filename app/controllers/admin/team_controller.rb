require_relative 'application_controller'
require_relative '../../models/user'
require_relative '../../helpers/application'

module Admin
  class TeamController < ApplicationController
    PASSWORD_LENGTH = 8

    PLAIN_CREDENTIAL_STORAGE = Dir.pwd + '/storages/plain_credential.txt'

    def info
      @resources = @@sessions
      render("admin/team/info")
    end

    def index
      @resources = User.all

      render("admin/team/index")
    end

    def create
      print 'Team Name             : '
      teamname = gets.chomp

      print 'Username              : '
      username = gets.chomp

      print 'Password              : '
      password = gets.chomp

      print 'Password Confirmation : '
      confirm = gets.chomp

      @resource = User.new(teamname: teamname, username: username, password: password, password_confirmation: confirm, token: Application.generate_token)
      if @resource.save
        render("admin/team/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Select username id for update : "
      id = gets.chomp

      return puts "User is not registered." unless @resource = User.find_by_id(id)
      
      print "New Teamname          : "
      teamname = gets.chomp

      print "New Username          : "
      username = gets.chomp

      puts "Keep it blank if you no want to change the password."
      print "New Password          : "
      password = gets.chomp

      print "Password Confirmation : "
      confirm = gets.chomp

      if @resource.update(teamname: teamname, username: username, password: password, password_confirmation: confirm)
        render("admin/team/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Select username id for delete : "
      id = gets.chomp

      return puts "User is not registered." unless @resource = User.find_by_id(id)

      unless @resource.blank?
        @resource.destroy

        puts "Username is deleted"
      else
        puts "Username is not registered"
      end
    end

    def batch_insert
      print 'Register Multiple Team, please seperate data with (,) : '
      teams = gets.chomp

      return puts 'Invalid inputs' if teams.blank? or teams.split(',').length < 1

      
      file = File.open(PLAIN_CREDENTIAL_STORAGE, 'a')

      teams.split(',').each do |team|
        password = SecureRandom.hex(PASSWORD_LENGTH)

        data = {
          username: team,
          password: password,
          password_confirmation: password,
          token: Application.generate_token
        }

        @resources = User.first_or_create(data)
        
        render("shared/error") unless @resources.errors.blank?

        file.write "Username : %s => password : %s\n" % [data[:username], data[:password]]

        puts 'Register Team : %s with password : %s | Success' % [data[:username], data[:password]]
      end

      file.close
    end

    def import
      print 'Please, insert the file path for importing data : '
      path = gets.chomp

      import_file = File.open(Dir.pwd + "/imports/" + path + '.txt', 'r')
      export_file = File.open(PLAIN_CREDENTIAL_STORAGE, 'a')

      import_file.each_line do |import|
        password = SecureRandom.hex(PASSWORD_LENGTH)

        import = import.split(':').map(&:strip)

        data = {
          teamname: import[0],
          username: import[1],
          password: password,
          password_confirmation: password,
          token: import[2]
        }

        @resources = User.first_or_create(data)

        render("shared/error") unless @resources.errors.blank?

        export_file.write "Team Name: %s, Username: %s, Password: %s\n" % [data[:teamname], data[:username], data[:password]]

        puts 'Register %s : %s with password : %s | Success' % [data[:teamname], data[:username], data[:password]]
      end

      import_file.close
      export_file.close
    end
  end
end
