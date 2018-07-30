#!/usr/bin/env ruby
require_relative '../config/initializers/environment'
require_relative '../config/route'
require_relative '../app/libs/routing'
require_relative '../app/controllers/authentication'

begin
  Libs::Routing.params({})
  Libs::Routing.dispatch('login')
rescue SignalException => e
  exit
rescue Exception => e
  puts e.message
  puts e.backtrace
  retry
end
