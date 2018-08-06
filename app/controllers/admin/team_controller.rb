require_relative 'application_controller'
require_relative '../../models/user'
require_relative '../../helpers/application'

module Admin
  class TeamController < ApplicationController
    PASSWORD_LENGTH = 8

    PLAIN_CREDENTIAL_STORAGE = Dir.pwd + '/storages/plain_credential.txt'

    def index
      @resources = User.all

      render("admin/team/index")
    end

    def create
      print 'Username              : '
      username = gets.chomp

      print 'Password              : '
      password = gets.chomp

      print 'Password Confirmation : '
      confirm = gets.chomp

      if @resource = User.create(username: username, password: password, password_confirmation: confirm, token: Application.generate_token)
        render("admin/team/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Select username id for update : "
      id = gets.chomp

      return puts "User is not registered." unless @resource = User.find_by_id(id)

      print "New Username          : "
      username = gets.chomp

      puts "Keep it blank if you no want to change the password."
      print "New Password          : "
      password = gets.chomp

      print "Password Confirmation : "
      confirm = gets.chomp

      if @resource.update(username: username, password: password, password_confirmation: confirm)
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
  end
end
