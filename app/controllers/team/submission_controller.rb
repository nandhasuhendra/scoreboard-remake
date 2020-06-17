require_relative 'application_controller'
require_relative "../../models/play"
require_relative '../../models/flag'
require_relative '../../models/score'
require_relative '../../models/submission'

module Team
  class SubmissionController < ApplicationController
    def create
      play = Play.first

      return puts "This fiture will be open at %s" % [play.start_time] if Time.now <= play.start_time
      return puts "Time is over!!!" if Time.now >= play.end_time

      print "Check flag : "
      flag = gets.chomp

      return puts "Flag is incorrect!!!" unless checking_flag(flag)

      unless @submit.valid?
        return puts "Flag in already submitted!!!" 
      else
        if @@sessions.id == @flag.user.id
          @submiter = Score.first_or_create(user_id: @@sessions.id, total_score: 0)
          Score.update(
            total_score: (@submiter.total_score + @flag.challenge.score), 
            user_id: @@sessions.id)
        else
          @owner = Score.first_or_create(user_id: @flag.user.id, total_score: 0)
          @owner.update(total_score: (@owner.total_score - play.reduction))

          @submiter = Score.first_or_create(user_id: @@sessions.id, total_score: 0)
          @submiter.update(total_score: (@submiter.total_score + @flag.challenge.score))
        end
      
        return puts "Flag is correct!!!"
      end
    end

    protected
      def checking_flag(flag)
        @flag = Flag
          .includes(:user, :challenge)
          .where(flag: flag)
          .first

        add_to_submittion_log(flag)

        return @flag
      end

      def add_to_submittion_log(flag)
        Flag.where(flag: flag).any? ? correct = {is_correct: true, owner_id: @flag.user.id, challenge_id: @flag.challenge.id} : correct = {is_correct: false, owner_id: nil, challnge_id: nil}

        @submit = Submission.create(
          submission: flag,
          is_correct: correct[:is_correct],
          owner_id: correct[:owner_id],
          submiter_id: @@sessions.id,
          challenge_id: correct[:challenge_id]
        )
      end
  end
end
