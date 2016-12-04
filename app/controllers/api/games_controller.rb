class Api::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_game, only: [:make_movement]
  before_action :check_game_status, only: [:make_movement]

  def new
    @game = Game.new
    Game.add_game @game

    human_player = HumanPlayer.new
    human_player.set_on_request_move(->(game, human_player){
      request_move_for(game, human_player)
    })
    ai_player = AIPlayer.new

    @game.players << human_player
    @game.players << ai_player
    @game.players.shuffle!
    if AIPlayer === @game.turn_for
      @game.next_move
    end

    render json: @game
  end

  def make_movement
    @game = Game.get_games.find{|g| g.id == params[:id]}
    @game.make_movement(params[:x], params[:y])
    if AIPlayer === @game.turn_for && !GameStatus.finished?(@game.board)
      @game.next_move
    end

    render json: @game
  end

  private
    def get_game
      @game = Game.get_games.find{|g| g.id == params[:id]}
      if @game.nil?
        head 404
      end
    end

    def check_game_status
      if GameStatus.finished?(@game.board)
        render json: @game
      end
    end
end