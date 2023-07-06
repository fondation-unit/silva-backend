# frozen_string_literal: true

class FaunasController < ApplicationController
    before_action :authenticate_user!
  
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
  