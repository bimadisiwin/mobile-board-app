class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to boards_path, flash: { notice: "「 #{board.title} の掲示板を作成しました」" }
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    # ビューに表示しないのでインスタンス変数ではなく、ローカル変数に代入
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board, flash: { notice: "「 #{board.title} の掲示板を編集しました」" }
  end

  private

  def board_params
    params.require(:board).permit(:body, :title)
  end
end
