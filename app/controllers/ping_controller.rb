class PingController < BaseApiController
  skip_before_filter :authenticate_user!, only: :ping

  def ping
    render json: { data: "Hello" }
  end
end

