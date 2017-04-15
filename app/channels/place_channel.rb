class PlaceChannel < ApplicationCable::Channel
  include Markers
  def subscribed
    # stream_from "some_channel"
    stream_from 'place'
  end

  def update_marks(params)
    update_markers(params)
  end
end
