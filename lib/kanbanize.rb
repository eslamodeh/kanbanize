require 'pry'
require 'gli'
require 'colorize'
require 'rest-client'
require 'json'
require 'set'
require 'active_model'
require 'kanbanize/base'
require 'kanbanize/config'
require 'kanbanize/board'

module Kanbanize
  class Error < StandardError; end

  extend GLI::App

  program_desc 'todo'

  command :init do |cmd|
    cmd.action do
      Kanbanize::Configurator.init
    end
  end

  command :boards do |sub_command|
    sub_command.command :list do |sub_command_2|
      sub_command_2.action do
        Kanbanize::Base.print(Kanbanize::Board.all)
      end
    end
  end
end
