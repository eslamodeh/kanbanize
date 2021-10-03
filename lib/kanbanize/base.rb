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
  end
end
