# frozen_string_literal: true

class Api::V1::FlorasController < ApplicationController
  before_action :authenticate_user!

  def create
    @flora = Flora.new(flora_params)
    return unless @flora.save

    @card = @flora.build_card(typeable: flora_params[:typeable], name: name, description: description)
    @card.save
  end

  private

    def flora_params
      params.require(:flora).permit(:associated_species, :typeable, :buildup_speed)
    end
end
