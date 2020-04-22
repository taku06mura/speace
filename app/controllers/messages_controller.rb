class MessagesController < ApplicationController
  before_action :set_team

  def index
    @message = Message.new
    @messages = @team.messages.includes(:user)
  end

  def create
    @message = @team.messages.new(message_params)
    if @message.save
      redirect_to team_messages_path(@team), notice: 'メッセージを送信しました'
    else
      @messages = @team.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力して下さい'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
