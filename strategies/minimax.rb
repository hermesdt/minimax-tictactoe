module Strategies
  class Minimax
    def initialize
    end

    def find_best_move(board, character, depth = 0, action = :max)
      # I know this should be generalized for other board sizes,
      # but runs very slow on other sizes than 3x3
      return [[1, 1], 1] if GameStatus.empty?(board)
      return [[], 0] if GameStatus.finished?(board)

      moves = {}

      board.each_possible_move do |i,j|

        score, new_board = score_for(board, i, j, character)
        score -= depth
        score *= -1 if action == :min

        new_character = Board::CHARACTERS.find{|c| c != character}
        new_action = action == :max ? :min : :max

        coords, recursive_score = find_best_move(new_board, new_character, depth + 1, new_action)
        moves["#{i}_#{j}"] = score + recursive_score
      end


      ordered_keys = moves.keys.sort{|x,y| moves[y] <=> moves[x]}
      best_move_key = ordered_keys.first

      # puts "board: #{board}"
      # puts "moves: #{moves.inspect}"
      # puts "best move: #{best_move_key}, character: #{character}, action: #{action}"

      [best_move_key.split("_").map(&:to_i), moves[best_move_key]]
    end

    def score_for(board, x, y, character)
      new_board = board.dup
      new_board[x][y] = character

      score = if GameStatus.finished?(new_board)
        if GameStatus.winner?(new_board, character)
          10
        else
          0
        end
      else
        if x == 1 && y == 1
          2
        else
          0
        end
      end

      [score, new_board]
    end
  end
end