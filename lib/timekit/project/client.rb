# frozen_string_literal: true

module Timekit
  class Project
    # Client class for the project resource
    class Client < Timekit::Client
      API_PATH = '/projects'

      def list
        get(API_PATH)
      end

      def show(id)
        get(API_PATH + '/' + id)
      end

      # TODO: skipped because not needed yet
      # def create
      #   post(API_PATH, params)
      # end

      # TODO: skipped because not needed yet
      # def update
      #   put(API_PATH + '/' + id + '/' + action)
      # end
    end
  end
end
