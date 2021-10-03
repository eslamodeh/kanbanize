# frozen_string_literal: true

module Kanbanize
  module Config
    class << self
      KANBANIZE_BOARD_IDS_KEY = 'kanbanize.board-ids'

      def add_board_id(board_id)
        `git config --add #{KANBANIZE_BOARD_IDS_KEY} #{board_id}`
      end

      def board_ids
        `git config --get-all #{KANBANIZE_BOARD_IDS_KEY}`.split("\n").map(&:to_i)
      end
    end
  end
end
