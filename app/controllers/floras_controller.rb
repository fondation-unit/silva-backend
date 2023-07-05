# frozen_string_literal: true

class FlorasController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @flora = Flora.new(flora_params)
        if @flora.save
            @card = @flora.build_card(typeable: flora_params[:typeable], name: name, description: description)
            @card.save
        end
    end

    private

        def flora_params
            params.require(:flora).permit(:associated_species, :typeable, :buildup_speed)
        end
end
  