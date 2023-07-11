# frozen_string_literal: true

class Api::V1::CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: CardSerializer.new(@cards).serializable_hash[:data], status: :ok
  end

  def show
    @card = Card.find(params[:id])
    render json: CardSerializer.new(@card).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @card = Card.new(card_params)

    return unless @card.save

    render json: {
      status: { code: 200, message: "Card created successfully." },
      data: CardSerializer.new(@card)
    }
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    render json: CardSerializer.new(@card).serializable_hash[:data][:attributes], status: :ok
  end

  private

    def card_params
      params.require(:card).permit(:typeable_type, attributes: %i[name description note typeable_type typeable_id])
    end
end

