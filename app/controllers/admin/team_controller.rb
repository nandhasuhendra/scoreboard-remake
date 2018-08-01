require_relative 'application_controller'
require_relative '../../models/user'

module Admin
  class TeamController < ApplicationController
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

    private
    def user_params
    end
  end
end
