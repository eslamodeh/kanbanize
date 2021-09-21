module Kanbanize
  module Configurator
    class << self
      KANBANIZE_BOARD_IDS_KEY = 'kanbanize.board-ids'

      def init
        `git config --remove-section kanbanize`
        configure_boards
        puts board_ids
      end

      private

      def configure_boards
        available_boards = Kanbanize::Board.all
        Kanbanize::Base.print(available_boards)

        print 'Enter board id(s) splitted by space: '.light_yellow

        while true
          ids = Set.new gets.chomp.split(' ').map(&:strip).map(&:to_i)

          if ids.subset? Set.new(available_boards.map(&:id))
            ids.each { |id| `git config --add #{KANBANIZE_BOARD_IDS_KEY} #{id}` }
            break
          else
            print 'Incorrect id(s), please enter board id(s) splitted by space: '.light_yellow
          end
        end
      end

      def board_ids
        `git config --get-all #{KANBANIZE_BOARD_IDS_KEY}`
      end
    end
  end
end
