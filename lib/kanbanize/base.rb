# frozen_string_literal: true

require 'kanbanize/class_methods'
require 'kanbanize/rest_client'

module Kanbanize
  class Base
    extend Kanbanize::ClassMethods
    extend Kanbanize::RestClient
    include ActiveModel::Model
    include ActiveModel::Validations
    include ActiveModel::Attributes

    def self.print(object)
      case object
      when Array
        puts ('*' * 10).light_yellow
        puts '#ID - #NAME'.green
        object.each do |model|
          puts "#{model.id} - #{model.name}".green
        end

        puts ('*' * 10).light_yellow
      end
    end

    # KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_KEY'
    # KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_HOSTNAME'
    # attr_reader :api_key, :api_host_name

    # validates :api_key, :api_host_name, presence: true

    # def initialize(*args)
    #   @api_key = ENV[KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME]
    #   @api_host_name = ENV[KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME]
    #   super
    # end

    # def print_errors(errors = [])
    #   errors.full_messages.each do |error|
    #     puts "* #{error}".red
    #   end
    # end
  end
end
