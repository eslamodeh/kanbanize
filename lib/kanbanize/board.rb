module Kanbanize
  class Board < Base
    attribute :board_id, :integer
    attribute :workspace_id, :integer
    attribute :is_archived, :integer
    attribute :name, :string
    attribute :description, :string

    def id
      board_id
    end
  end
end
