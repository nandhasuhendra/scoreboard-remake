require_relative 'application_controller'
require_relative '../../models/flag'
require_relative '../../models/user'
require_relative '../../models/challenge'
require_relative 'concern/generate'

module Admin
  class FlagController < ApplicationController
    include Generate

    def index
      @resources = Flag.all

      render("admin/flag/index")
    end

    def create
      puts "Format flag SlashRootCTF{flag_flag}"
      print "New Flag       : "
      flag = gets.chomp

      print "Team Id        : "
      team = gets.chomp

      print "flag Id        : "
      chall = gets.chomp

      @resource = Flag.new(flag: flag, user_id: team, challenge_id: chall)
      if @resource.save
        render("admin/flag/create")
      else
        render("shared/error")
      end
    end

    def update
      puts "Format flag SlashRootCTF{flag_flag}"
      print "Insert flag for update   : "
      id = gets.chomp

      return puts "Flag is not added." unless @resource = Flag.find_by_id(id)

      print "New Flag                 : "
      flag = gets.chomp

      print "Team Id                  : "
      team = gets.chomp

      print "flag Id                  : "
      chall = gets.chomp

      if @resource.update(flag: flag, user_id: team, challenge_id: chall)
        render("admin/flag/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Select flag id for delete : "
      id = gets.chomp

      return puts "flag is not added." unless @resource = Flag.find_by_id(id)

      unless @resource.blank?
        @resource.destroy

        puts "flag is deleted"
      else
        puts "flag is not found"
      end
    end

    def batch_flag
      puts 'Register Multiple Flag, please seperate data with (,)'
      puts 'Example Flag:UserID:ChallengeID,Flag:UserID:ChallengeID,...'
      print 'Input the Flags :'
      flags = gets.chomp

      return puts 'Invalid inputs' if flags.blank? or flags.split(',').length < 1

      flags.split(',').each do |flag|
        
        datas = flag.split(':')

        data = {
          flag: datas[0],
          user_id: datas[1],
          challenge_id: datas[2]
        }

        @resources = Flag.first_or_create(data)
        
        render("shared/error") unless @resources.errors.blank?

        puts "Flag %s with user %s in %s challenge | Success" % [data[:flag], data[:user_id], data[:challenge_id]]
      end
    end

    def auto_generate
      users  = User.all 
      challs = Challenge.all 

      generate_flag(users, challs)

      puts "Generate is done"
    end

    def import
      print 'Please, insert the file path for importing data : '
      path = gets.chomp

      import_file = File.open(Dir.pwd + "/imports/" + path + '.txt', 'r')

      import_file.each_line do |import|

        import = import.split(':').map(&:strip)

        data = {
          flag: import[0],
          user_id: import[1],
          challenge_id: import[2]
        }

        @resources = Flag.first_or_create(data)

        render("shared/error") unless @resources.errors.blank?

        puts "Flag %s with user %s in %s challenge | Success" % [data[:flag], data[:user_id], data[:challenge_id]]
      end

      import_file.close
    end
  end
end
