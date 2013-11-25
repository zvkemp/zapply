# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# ZapplyLite::Application.config.secret_token = '7fa81c7518215208921e1d22f9f7e4547505ac2b2a2c3be8e25338b2d28e1307a652b60ed42e0ebcd7b09672a2de29b2a82ec0ec82d80c5ddaf0037f16d27b3f'

# secret = ENV['ZAPPLY_SECRET']


# def generate_and_store_new_secret
#   secret = SecureRandom.hex(64)
#   File.open(File.expand_path("~/.bashrc"), "a+") {|file| file << %Q{\nexport ZAPPLY_SECRET="#{secret}"} }
#   system("export ZAPPLY_SECRET=")
# end

class ZapplyLite::GenerateSecretToken
  attr_reader :token
  
  def initialize
    puts "No secret token found. Generating a new one..."
    @token = SecureRandom.hex(64)
    append_to_bashrc
    export_to_environment
  end

  private
    def export_string
      %Q{export ZAPPLY_SECRET="#{token}"}
    end

    def append_to_bashrc
      puts "   ...appending token to .bashrc"
      File.open(File.expand_path("~/.bashrc"), "a+"){|file| file << %Q{\n#{export_string}} }
    end

    def export_to_environment
      puts "   ...exporting token to environment"
      system(export_string)
    end
end

ZapplyLite::Application.config.secret_token = ENV.fetch('ZAPPLY_SECRET'){ ZapplyLite::GenerateSecretToken.new.token }