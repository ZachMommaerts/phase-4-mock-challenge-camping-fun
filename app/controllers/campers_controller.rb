class CampersController < ApplicationController

    def index
        render json: Camper.all, except: ['signups', 'signups.activities']
    end

    def show
        render json: Camper.find(params[:id]), serializer: CamperActivitiesSerializer
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Camper not found"}, status: :not_found
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
