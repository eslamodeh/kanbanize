require 'kanbanize/cli/board'

module Kanbanize
  module Cli
    class Base < Thor
      desc 'init', 'Initialize Kanbanize'
      def init
        `git config --remove-section kanbanize` if Kanbanize::Config.board_ids.present?
        configure_boards
      end

      desc 'boards', 'Boards commands'
      subcommand 'boards', Kanbanize::Cli::Board

      private

      def configure_boards
        available_boards = Kanbanize::Board.all
        Kanbanize::Base.print(available_boards)

        print 'Enter board id(s) splitted by space: '.light_yellow

        while true
          ids = Set.new ask('').split(' ').map(&:strip).map(&:to_i)

          if ids.subset? Set.new(available_boards.map(&:id))
            ids.each { |id| Kanbanize::Config.add_board_id(id) }
            break
          else
            print 'Incorrect id(s), please enter board id(s) splitted by space: '.light_yellow
          end
        end
      end
    end
  end
end
