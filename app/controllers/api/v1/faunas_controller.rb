class Api::V1::FaunasController < ApplicationController

  def index
      @faunas = Fauna.all
      render json: FaunaSerializer.new(@faunas).serializable_hash[:data], status: :ok
  end

  def show
      @fauna = Fauna.find(params[:id])
      options = {
        include: [:habitats]
      }
      render json: FaunaSerializer.new(@fauna, options), status: :ok
  end

  private

      def fauna_params
          params.require(:fauna).permit()
      end

end
