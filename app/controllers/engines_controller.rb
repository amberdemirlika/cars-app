class EnginesController < ApplicationController
  def index
  render json: {name: "goodbye"}
  end
end
