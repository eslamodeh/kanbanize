require 'pry'
require 'colorize'
require 'rest-client'
require 'json'
require 'set'
require 'active_model'
require 'thor'

require 'kanbanize/cli/base'
require 'kanbanize/base'
require 'kanbanize/config'
require 'kanbanize/board'

module Kanbanize
  class Error < StandardError; end

  def self.run(args)
    Kanbanize::Cli::Base.start(args)
  end
end
