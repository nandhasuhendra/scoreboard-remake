require_relative 'application_controller'
require_relative '../../models/challenge'
require_relative '../../helpers/application'

module Admin
  class ChallengeController < ApplicationController
    def index
      @resources = Challenge.all

      render("admin/challenge/index")
    end

    def create
      print 'Challenge Name        : '
      @challenge = gets.chomp

      print 'Description           : '
      @description = gets.chomp

      print 'Score                 : '
      @score = gets.chomp

      puts "Insert the real flag if you want to use the auto-generate flag"
      print 'Real FLag              : '
      @real_flag = gets.chomp

      @resource = Challenge.new(name: @challenge, description: @description, score: @score, real_flag: @real_flag, token: Application.generate_token)
      if @resource.save
        render("admin/challenge/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Insert challenge for update : "
      @challenge = gets.chomp

      return puts "Challenge is not added." unless @resource = Challenge.find_by_name(@challenge)

      print "Challenge name             : "
      @challenge = gets.chomp

      print "Description                : "
      @description = gets.chomp

      print "Score                      : "
      @score = gets.chomp

      puts "Re-Insert the real flag if you want to use the auto-generate flag"
      print "Real Flag                  : "
      @real_flag = gets.chomp

      if @resource.update(name: @challenge, description: @description, score: @score, real_flag: @real_flag)
        render("admin/challenge/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Delete challenge : "
      @challenge = gets.chomp

      return puts "Challenge is not added." unless @resource = Challenge.find_by_name(@challenge)
    
      unless @resource.blank?
        @resource.destroy

        puts "Challenge is deleted"
      else
        puts "Challenge is not registered"
      end
    end
  end
end
