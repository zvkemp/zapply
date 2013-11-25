# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# ZapplyLite::Application.config.secret_token = '7fa81c7518215208921e1d22f9f7e4547505ac2b2a2c3be8e25338b2d28e1307a652b60ed42e0ebcd7b09672a2de29b2a82ec0ec82d80c5ddaf0037f16d27b3f'

secret = ENV['ZAPPLY_SECRET']
if !secret
  secret = SecureRandom.hex(64)
  File.open(File.expand_path("~/.bashrc"), "a+") {|file| file << %Q{export ZAPPLY_SECRET="#{secret}"} }
end
ZapplyLite::Application.config.secret_token = secret