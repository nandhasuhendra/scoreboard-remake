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
      print 'Category ID           : '
      category = gets.chomp

      print 'Challenge Name        : '
      challenge = gets.chomp

      print 'Description           : '
      description = gets.chomp

      print 'Score                 : '
      score = gets.chomp

      puts "Insert the real flag if you want to use the auto-generate flag"
      print 'Real FLag              : '
      real_flag = gets.chomp

      if @resource = Challenge.create(name: challenge, description: description, real_flag: real_flag, token: ApplicationController.generate_token, score: score, category_id: category)
        render("admin/challenge/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Insert challenge id for update : "
      id = gets.chomp

      return puts "Challenge is not added." unless @resource = Challenge.find_by_id(id)

      print 'Category ID                : '
      category = gets.chomp

      print "Challenge name             : "
      challenge = gets.chomp

      print "Description                : "
      description = gets.chomp

      print "Score                      : "
      score = gets.chomp

      puts "Re-Insert the real flag if you want to use the auto-generate flag"
      print "Real Flag                  : "
      real_flag = gets.chomp

      if @resource = Challenge.update(name: challenge, description: description, real_flag: real_flag, score: score, category_id: category)
        render("admin/challenge/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Select challenge id for delete : "
      id = gets.chomp

      return puts "Challenge is not added." unless @resource = Challenge.find_by_id(id)
    
      unless @resource.blank?
        @resource.destroy

        puts "Challenge is deleted"
      else
        puts "Challenge is not registered"
      end
    end
  end
end
