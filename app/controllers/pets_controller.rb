class PetsController < ApplicationController
  def index
    @pets = PetstoreClient::Pet.find_by_status(params[:status])
  end
end
