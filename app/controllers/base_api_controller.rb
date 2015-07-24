class BaseApiController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  private

  def parse_request
    body = request.body.read
    if body.empty?
      {}
    else
      JSON.parse(body)
    end
  end

  def json_params
    ActionController::Parameters.new(parse_request)
  end

  def handle_params
    begin
      yield
    rescue ActionController::ParameterMissing
      bad_request
      return false
    end
  end
end
