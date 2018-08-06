module Generate
  extend ActiveSupport::Concern

  def generate_flag(users, challs)
    users.each do |user|
      challs.each do |chall|
        next if user.is_admin == true

        result = "SlashRootCTF{%s}" % [Digest::MD5.hexdigest(user.token + chall.token + chall.real_flag)]

        Flag.create(
          flag: result,
          user_id: user.id,
          challenge_id: chall.id
        )
      end
    end
  end
end
