# frozen_string_literal: true

class FaunasController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @fauna = Fauna.new(fauna_params)
        if @fauna.save
            @card = @fauna.build_card(typeable: fauna_params[:typeable], name: "test", description: "test desc")
            @card.save
        end
    end

    private

        def fauna_params
            params.require(:fauna).permit(:animal_scientific_order_id, :typeable, :habitat, :micro_habitat, :predator)
        end
end
  