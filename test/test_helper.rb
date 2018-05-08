require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  # Since we are not using fixtures, comment this line out...
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include Contexts

  # Add the infamous deny method...
  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  # A method to login in a vet to start things off
  def login_admin
    @admin = FactoryBot.create(:user, email: "cmanaog@gmail.com", first_name: "Christian", last_name: "Manaog", username: "christian", password: "secret", password_confirmation: "secret", role: "admin", active: true)
    get login_path
    post sessions_path, params: { email: "cmanaog@gmail.com", password: "secret" }
  end

  def login_volunteer
    @volunteer = FactoryBot.create(:user, email: "catmeow@meow.com", first_name: "Meowers", last_name: "McMeowers", username: "meowie", password: "password", password_confirmation: "password", role: "volunteer", active: true)
    get login_path
    post sessions_path, params: {email: "catmeow@meow.com", password: "password"}
  end

  # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
end