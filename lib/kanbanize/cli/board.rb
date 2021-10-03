module Kanbanize
  module Cli
    class Board < Thor
      desc 'list', 'List configured boards'
      option :all, aliases: :a
      def list
        boards = Kanbanize::Board.all

        unless options.key? 'all'
          current_board_ids = Kanbanize::Config.board_ids
          boards = boards.select { |board| current_board_ids.include? board.id }
        end

        Kanbanize::Base.print(boards)
      end
    end
  end
end
