# frozen_string_literal: true

module Kanbanize
  module Connection
    KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_KEY'
    KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_HOSTNAME'

    class << self
      def status
        if get_api_key.nil?
          puts "* Environment variable #{KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME} is empty, please add it first.".red
        end

        if get_api_hostname.nil?
          puts "* Environment variable #{KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME} is empty, please add it first.".red
        end
      end

      private

      def get_api_key
        ENV[KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME]
      end

      def get_api_hostname
        ENV[KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME]
      end
    end
  end
end
