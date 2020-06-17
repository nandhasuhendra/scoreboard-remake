require_relative 'application_controller'

module Team
  class PassphraseController < ApplicationController
    def index
      print 'Generate PassPhrase : '
      passphrase = gets.chomp

      return puts "Token is not ready for Admin." if @@sessions.is_admin

      puts "Result : %s" % [Digest::MD5.hexdigest(@@sessions.token + passphrase)]
    end
  end
end
