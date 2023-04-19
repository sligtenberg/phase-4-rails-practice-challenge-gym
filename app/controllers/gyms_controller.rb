class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Gym.all
    end

    def show
        render json: find_gym
    end

    def destroy
        find_gym.destroy
        render json: {}, status: :no_content
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
    
end
