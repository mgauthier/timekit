# frozen_string_literal: true

require_relative './timekit/config'
require_relative './timekit/client'
require_relative './timekit/user'
require_relative './timekit/credential'
require_relative './timekit/app'
require_relative './timekit/calendar'
require_relative './timekit/event'
require_relative './timekit/request'
require_relative './timekit/findtime'
require_relative './timekit/filtercollection'
require_relative './timekit/widget'
require_relative './timekit/booking'

# Timekit class is responsible for handling configurations
# and provides helpers for instantiating clients for apis
module Timekit
  @config = Timekit::Config.new

  def self.config
    @config
  end

  def self.configure(server_key:, client_key: nil)
    config[:server_key] = server_key
    config[:client_key] = client_key unless client_key.nil?
    config
  end

  def self.calendar_client
    Timekit::Calendar::Client.new
  end

  def self.app_client
    Timekit::App::Client.new
  end

  def self.credential_client
    Timekit::Credential::Client.new
  end

  def self.event_client
    Timekit::Event::Client.new
  end

  def self.user_client
    Timekit::User::Client.new
  end

  def self.findtime_client
    Timekit::Findtime::Client.new
  end

  def self.widget_client
    Timekit::Widget::Client.new
  end

  def self.booking_client
    Timekit::Booking::Client.new
  end

  def self.project_client
    Timekit::Project::Client.new
  end
end
