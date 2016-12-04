require 'byebug'

module Strategies
  class Minimax
    def initialize
    end

    def find_best_move(board, character, depth = 0, action = :max)
      return [[], 0] if GameStatus.finished?(board)

      moves = {}

      board.each_possible_move do |i,j|

        score, new_board = score_for(board, i, j, character)
        score -= depth

        new_character = Board::CHARACTERS.find{|c| c != character}
        new_action = action == :max ? :min : :max

        coords, recursive_score = find_best_move(new_board, new_character, depth + 1, new_action)
        moves["#{i}_#{j}"] = score + recursive_score
      end


      ordered_keys = moves.keys.sort{|x,y| moves[y] <=> moves[x]}
      best_move_key = action == :max ? ordered_keys.first : ordered_keys.last

      [best_move_key.split("_").map(&:to_i), moves[best_move_key]]
    end

    def score_for(board, x, y, character)
      new_board = board.dup
      new_board[x][y] = character

      if GameStatus.finished?(new_board)
        if GameStatus.winner?(new_board, character)
          [10, new_board]
        else
          [0, new_board]
        end
      else
        [0, new_board]
      end
    end
  end
end