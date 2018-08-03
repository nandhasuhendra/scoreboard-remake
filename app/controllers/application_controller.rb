class ApplicationController
  def set_params(params = {})
    fail 'Parameter is not hash' if !params.is_a?(Hash) and params != {}

    @@params = params
  end

  def set_session(sessions)
    @@sessions = sessions
  end

  def readline
    commands = %w(help logout)
    commands = commands.concat(@command_completion ||= [])

    comp = proc { |s| commands.grep(/^#{Regexp.escape(s)}/) }
    
    Readline.completion_append_character = " "
    Readline.completion_proc = comp

    identity = '%s@SlashRootCTF3.0 ~:> ' % [@@sessions[:username]]

    command = Readline.readline(identity, true).strip

    check_allowed_command(command, commands)

    if command == 'help'
      puts 'Supported Command : '

      commands.each {|command| puts '-- %s' % [command] }

      command = ''
    end

    command
  end

  def render(template)
    puts ERB.new(File.read(Dir.pwd + "/app/templates/" + template + ".erb")).result(binding).strip
  end

  def check_allowed_command(input, commands)
    puts "Unrecognize Command" if commands.select {|command| command == input}.first.nil?
  end

  def method_missing(m, *args, &block)
    fail "Called #{m} with #{args.inspect} and #{block}"
  end
end

