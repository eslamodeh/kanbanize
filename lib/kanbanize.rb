require 'pry'
require 'gli'
require 'colorize'
require 'kanbanize/connection'

module Kanbanize
  class Error < StandardError; end

  extend GLI::App

  program_desc 'todo'

  command :connection do |sub_command|
    sub_command.command :status do |sub_command_2|
      sub_command_2.action do
        Kanbanize::Connection.status
      end
    end
  end
end
