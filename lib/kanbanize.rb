require 'pry'
require 'gli'
require 'colorize'
require 'rest-client'
require 'json'
require 'active_model'
require 'kanbanize/base'
require 'kanbanize/board'

module Kanbanize
  class Error < StandardError; end

  extend GLI::App

  program_desc 'todo'

  command :boards do |sub_command|
    sub_command.command :list do |sub_command_2|
      sub_command_2.action do
        puts ('*' * 10).blue
        puts '#ID - #NAME'.green
        Kanbanize::Board.all.each do |board|
          puts "#{board.id} - #{board.name}".green
        end

        puts ('*' * 10).blue
      end
    end
  end
end
