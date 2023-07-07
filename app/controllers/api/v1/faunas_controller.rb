# frozen_string_literal: true

class Api::V1::FaunasController < ApplicationController
    before_action :authenticate_user!

    def index
        @faunas = Fauna.all
        render json: FaunaSerializer.new(@faunas).serializable_hash[:data], status: :ok
    end
  
    def show
        @fauna = Fauna.find(params[:id])
        options = {
          include: %i[card animal_scientific_order habitats micro_habitats predators]
        }
        render json: FaunaSerializer.new(@fauna, options), status: :ok
    end
  
    def create
        @fauna = Fauna.new(animal_scientific_order_id: fauna_params[:animal_scientific_order_id])
        if @fauna.save
            @fauna.build_associations(fauna_params)

            return render json: {
                status: { code: 200, message: "Fauna created successfully." },
                data: FaunaSerializer.new(@fauna)
            }
        end
    end

    def update
        @fauna = Fauna.find(params[:id])
        if @fauna.update(animal_scientific_order_id: fauna_params[:animal_scientific_order_id])
            @fauna.update_associations(fauna_params)
            return render json: {
                status: { code: 200, message: "Fauna updated successfully." },
                data: FaunaSerializer.new(@fauna)
            }
        end
    end

    def destroy
        @fauna = Fauna.find(params[:id])
        @fauna.destroy
    end

    private

        def fauna_params
            params.require(:fauna).permit(
                :animal_scientific_order_id,
                card_attributes: %i[typeable name description],
                habitats_attributes: [],
                micro_habitats_attributes: [],
                predators_attributes: []
            )
        end
end
  