require_relative 'application_controller'
require_relative '../../models/user'

module Admin
  class TeamController < ApplicationController
    PASSWORD_LENGTH = 8

    PLAIN_CREDENTIAL_STORAGE = Dir.pwd + '/storages/plain_credential.txt'

    def index
      @resources = User.all

      render("team/index.erb")
    end

    def create
      print 'Username              : '
      @username = gets.chomp

      print 'Password              : '
      @password = gets.chomp

      print 'Password Confirmation : '
      @confirm = gets.chomp

      @resource = User.new(username: @username, password: @password, password_confirmation: @confirm)
      if @resource.save
        render("team/create.erb")
      else
        render("shared/error.erb")
      end
    end

    def update
      print "Insert username for update : "
      @username = gets.chomp

      @resource = User.find_by_username(@username)

      print "New Username          : "
      @username = gets.chomp

      print "New Password          : "
      @password = gets.chomp

      print "Password Confirmation : "
      @confirm = gets.chomp

      if @resource.update(username: @username, password: @password, password_confirmation: @confirm)
        render("team/edit.erb")
      else
        render("shared/error.erb")
      end
    end

    def delete
      print "Delete username : "
      @username = gets.chomp

      @resource = User.find_by_username(@username)
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
          password_confirmation: password
        }

        team = User.first_or_create(data)
        
        render("shared/error.erb") unless team.errors.blank?

        file.write "%s,%s\n" % [data[:username], data[:password]]

        puts 'Register Team : %s with password : %s | Success' % [data[:username], data[:password]]
      end

      file.close
    end

    private
    def user_params
    end
  end
end
