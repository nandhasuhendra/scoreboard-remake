class Application
  def self.generate_token
    SecureRandom.hex(8)
  end
end
