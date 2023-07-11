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
end