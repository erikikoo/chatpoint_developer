class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(list)
    ActionCable.server.broadcast 'appearance_channel', appearances: list
  end
end