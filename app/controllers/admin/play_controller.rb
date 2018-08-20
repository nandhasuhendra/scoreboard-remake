require_relative 'application_controller'
require_relative '../../models/play'

module Admin
  class PlayController < ApplicationController
    def set_reduction
      print 'Set point reduction : '
      point = gets.to_i

      return puts "Point reduction has been set." if Play.first_or_create(reduction: point)
    end

    def set_play_time
      puts 'Set how long will play CTF : '
      puts 'Format (Y-M-D H:M:S)'
      print 'Starting from : '
      start_at  = gets.chomp
      print 'End until     : '
      end_until = gets.chomp

      return puts "Play time has been set." if Play.first_or_create(start_time: Time.parse(start_at), end_time: Time.parse(end_until))
    end
  end
end
