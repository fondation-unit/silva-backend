class Api::V1::ScenariiController < ApplicationController

    def index
        @scenarii = Scenario.all
        render json: ScenarioSerializer.new(@scenarii).serializable_hash[:data], status: :ok
    end

    def show
        @scenario = Scenario.find(params[:id])
        render json: ScenarioSerializer.new(@scenario).serializable_hash[:data][:attributes], status: :ok
    end

end
