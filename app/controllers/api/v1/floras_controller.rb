# frozen_string_literal: true

class Api::V1::FlorasController < ApplicationController
  before_action :authenticate_user!

  def index
    @floras = Flora.all
    render json: FloraSerializer.new(@floras).serializable_hash[:data], status: :ok
  end

  def show
    @flora = Flora.find(params[:id])
    options = {
      include: %i[card species]
    }
    render json: FloraSerializer.new(@flora, options), status: :ok
  end

  def create
    @flora = Flora.new(buildup_speed: flora_params[:buildup_speed])

    return unless @flora.save

    @flora.build_associations(flora_params)

    render json: {
      status: { code: 200, message: "Flora created successfully." },
      data: FloraSerializer.new(@flora)
    }
  end



  private

    def flora_params
      params.require(:flora).permit(
        :typeable,
        :buildup_speed,
        card_attributes: %i[typeable name description],
        species_attributes: []
      )
    end
end
